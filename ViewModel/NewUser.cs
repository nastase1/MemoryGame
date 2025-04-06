using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows.Media.Imaging;
using MemoryGame.Model;
using MemoryGame.Service;

namespace MemoryGame.ViewModel
{ 
    public class NewUser : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public event Action<User> NewUserCreated;

        private string _firstName;
        public string FirstName
        {
            get => _firstName;
            set { _firstName = value; OnPropertyChanged("FirstName"); }
        }

        private string _lastName;
        public string LastName
        {
            get => _lastName;
            set { _lastName = value; OnPropertyChanged("LastName"); }
        }

        private BitmapImage _userImage;
        public BitmapImage UserImage
        {
            get => _userImage;
            set { _userImage = value; OnPropertyChanged("UserImage"); }
        }

        public ICommand UploadImageCommand { get; }
        public ICommand SaveNewUserCommand { get; }

        public NewUser()
        {
            UploadImageCommand = new RelayCommand(UploadImage);
            SaveNewUserCommand = new RelayCommand(SaveNewUser, CanSaveNewUser);
        }

        private void UploadImage(object parameter)
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.Filter = "Image Files|*.jpg;*.jpeg;*.png;*.bmp";
            if (dlg.ShowDialog() == true)
            {
                BitmapImage image = new BitmapImage(new Uri(dlg.FileName));
                UserImage = image;
            }
        }

        private bool CanSaveNewUser(object parameter)
        {
            return !string.IsNullOrEmpty(FirstName) &&
                   !string.IsNullOrEmpty(LastName) &&
                   UserImage != null;
        }

        private void SaveNewUser(object parameter)
        {
            User newUser = new User
            {
                FirstName = this.FirstName,
                LastName = this.LastName,
                ProfileImagePath = this.UserImage.UriSource.ToString()
            };

            NewUserCreated?.Invoke(newUser);

            if (parameter is System.Windows.Window window)
            {
                window.Close();
            }
        }

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }

}
