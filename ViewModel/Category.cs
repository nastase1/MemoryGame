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
    class Category : INotifyPropertyChanged
    {
        private ImageCategory _selectedCategory;
        public ImageCategory SelectedCategory
        {
            get => _selectedCategory;
            set
            {
                _selectedCategory = value;
                OnPropertyChanged(nameof(SelectedCategory));
            }
        }

        public ICommand SaveCategoryCommand { get; }

        public event System.Action<ImageCategory> CategorySaved;

        private User _user;

        public Category(User user)
        {
            _user = user;
            SelectedCategory = user.Category != default ? user.Category : ImageCategory.Cars;
            SaveCategoryCommand = new RelayCommand(SaveCategory);
        }

        private void SaveCategory(object parameter)
        {
            _user.Category = SelectedCategory;
            SaveUserToJson(_user);

            Application.Current.Properties["CurrentUser"] = _user;
            CategorySaved?.Invoke(SelectedCategory);

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
                existingUser.Category = user.Category;
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
