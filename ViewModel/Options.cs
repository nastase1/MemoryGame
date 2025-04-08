using MemoryGame.Model;
using MemoryGame.Service;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows;
using System.Text.Json;
using System.IO;

namespace MemoryGame.ViewModel
{
    class Options :INotifyPropertyChanged
    {
        private User _user;


        private BoardType _selectedBoardType;
        public BoardType SelectedBoardType
        {
            get => _selectedBoardType;
            set
            {
                _selectedBoardType = value;
                OnPropertyChanged(nameof(SelectedBoardType));
            }
        }

        private int _rows;
        public int Rows
        {
            get => _rows;
            set
            {
                _rows = value;
                OnPropertyChanged(nameof(Rows));
            }
        }

        private int _columns;
        public int Columns
        {
            get => _columns;
            set
            {
                _columns = value;
                OnPropertyChanged(nameof(Columns));
            }
        }

        public ICommand SaveOptionsCommand { get; }

        public Options(User user)
        {
            _user = user;
            SelectedBoardType = user.BoardType != default ? user.BoardType : BoardType.Standard;
            if (SelectedBoardType == BoardType.Custom)
            {
                Rows = user.BoardRows;
                Columns = user.BoardColumns;
            }
            else
            {
                Rows = 4;
                Columns = 4;
            }
            SaveOptionsCommand = new RelayCommand(SaveOptions);
        }

        private void SaveOptions(object parameter)
        {
            if (SelectedBoardType == BoardType.Custom)
            {
                if (Rows < 2 || Rows > 6 || Columns < 2 || Columns > 6)
                {
                    MessageBox.Show("The board dimension should be between 2 and 6.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if ((Rows * Columns) % 2 != 0)
                {
                    MessageBox.Show("Card numbers(Rows x Columns) should be even.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }

            _user.BoardType = SelectedBoardType;
            if (SelectedBoardType == BoardType.Custom)
            {
                _user.BoardRows = Rows;
                _user.BoardColumns = Columns;
            }
            else
            {
                _user.BoardRows = 4;
                _user.BoardColumns = 4;
            }

            SaveUserToJson(_user);

            if (parameter is Window window)
            {
                window.Close();
            }
        }

        private void SaveUserToJson(User user)
        {
            string filePath = "users.json";
            List<User> users = new List<User>();

            if (File.Exists(filePath))
            {
                string json = File.ReadAllText(filePath);
                users = JsonSerializer.Deserialize<List<User>>(json) ?? new List<User>();
            }

            var existingUser = users.FirstOrDefault(u => u.Id == user.Id);
            if (existingUser != null)
            {
                existingUser.BoardType = user.BoardType;
                existingUser.BoardRows = user.BoardRows;
                existingUser.BoardColumns = user.BoardColumns;
            }
            else
            {
                users.Add(user);
            }

            string updatedJson = JsonSerializer.Serialize(users, new JsonSerializerOptions { WriteIndented = true });
            File.WriteAllText(filePath, updatedJson);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}

