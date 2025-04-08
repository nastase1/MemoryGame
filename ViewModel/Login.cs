using MemoryGame.Model;
using MemoryGame.View;
using MemoryGame.Service;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows;
using System.Text.Json;
using System.IO;
using System.Diagnostics;

namespace MemoryGame.ViewModel
{
    public class Login : INotifyPropertyChanged
    {
        private const string UsersFile = "users.json";
        public ObservableCollection<User> Users { get; } = new ObservableCollection<User>();

        private User _selectedUser;
        public User SelectedUser
        {
            get => _selectedUser;
            set
            {
                _selectedUser = value;
                OnPropertyChanged(nameof(SelectedUser));
            }
        }

        public ICommand NewUserCommand { get; }
        public ICommand DeleteUserCommand { get; }

        public ICommand StartGameCommand { get; }

        public ICommand ExitCommand { get; }

        public Login()
        {
            LoadUsers();

            NewUserCommand = new RelayCommand(OpenNewUserWindow);
            DeleteUserCommand = new RelayCommand(DeleteUser, CanDeleteUser);

            StartGameCommand = new RelayCommand(StartGame, CanStartGame);
            ExitCommand = new RelayCommand(ExitApplication);
        }

        private void OpenNewUserWindow(object parameter)
        {
            var newUserViewModel = new NewUser();
            newUserViewModel.NewUserCreated += user =>
            {
                int newId = (Users.Any() ? Users.Max(u => u.Id) : 0) + 1;
                user.Id = newId;

                Users.Add(user);
                SaveUsers();
            };

            var newUserWindow = new NewUserWindow
            {
                DataContext = newUserViewModel
            };
            newUserWindow.ShowDialog();
        }

        private async void DeleteUser(object parameter)
        {
            if (SelectedUser != null)
            {
                string baseDir = AppDomain.CurrentDomain.BaseDirectory;
                string saveFolder = Path.Combine(baseDir, "Saves");
                string gameFileName = Path.Combine(saveFolder, $"GameSave_{SelectedUser.Id}.json");

                if (File.Exists(gameFileName))
                {
                    try
                    {
                        File.Delete(gameFileName);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Eroare la ștergerea jocului salvat: " + ex.Message);
                    }
                }

                await StatisticsService.RemoveStatisticsAsync(SelectedUser.Id);

                Users.Remove(SelectedUser);
                SaveUsers();
            }
        }


        private bool CanDeleteUser(object parameter)
        {
            return SelectedUser != null;
        }

        private void StartGame(object parameter)
        {
            if (parameter is Window loginWindow)
            {
                Application.Current.Properties["LoginWindow"] = loginWindow;
            }

            if (SelectedUser != null)
            {
                var menuWindow = new MenuWindow()
                {
                    DataContext = new Menu(SelectedUser)
                };
                menuWindow.Show();
            }

            
            if(parameter is Window window)
            {
                window.Hide();
            }
        }
        private bool CanStartGame(object parameter)
        {
            return SelectedUser != null;
        }

        private void ExitApplication(object parameter)
        {
            Application.Current.Shutdown();
        }


        private void LoadUsers()
        {
            try
            {
                if (File.Exists(UsersFile))
                {
                    string json = File.ReadAllText(UsersFile);
                    var loadedUsers = JsonSerializer.Deserialize<ObservableCollection<User>>(json);
                    if (loadedUsers != null)
                    {
                        foreach (var user in loadedUsers)
                        {
                            Users.Add(user);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error to load the users: " + ex.Message);
            }
        }

        private void SaveUsers()
        {
            try
            {
                var json = JsonSerializer.Serialize(Users.ToList());
                File.WriteAllText(UsersFile, json);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Eroare la salvarea utilizatorilor: " + ex.Message);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }

}
