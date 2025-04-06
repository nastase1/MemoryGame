using MemoryGame.Model;
using MemoryGame.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using MemoryGame.View;
using System.Windows;
using System.Windows.Input;

namespace MemoryGame.ViewModel
{
    class Menu : INotifyPropertyChanged
    {
        private User _user;
        public ICommand OpenCategoryCommand { get; }
        public ICommand NewGameCommand { get; }
        public ICommand OpenOptionsCommand { get; }
        public ICommand OpenAboutCommand { get; }
        public ICommand ExitCommand { get; }

        public Menu()
        {
        }

        public Menu(User user)
        {
            _user = user;
            OpenCategoryCommand = new RelayCommand(OpenCategoryWindow);
            ExitCommand = new RelayCommand(ExitMenuWindow);
            OpenOptionsCommand = new RelayCommand(OpenOptionsWindow);
            OpenAboutCommand = new RelayCommand(OpenAboutWindow);
            NewGameCommand = new RelayCommand(OpenNewGameWindow);
        }
        public string FirstName => _user.FirstName;
        public string LastName => _user.LastName;


        private void OpenCategoryWindow(object parameter)
        {
            var categoryViewModel = new Category(_user);
            
            categoryViewModel.CategorySaved += selectedCategory =>
            {
            };

            var categoryWindow = new CategoryWindow
            {
                DataContext = categoryViewModel,
                Owner = parameter as Window  
            };
            categoryWindow.ShowDialog();
        }

        private void OpenNewGameWindow(object parameter)
        {
            if (parameter is Window menuWindow)
            {
                Application.Current.Properties["MenuWindow"] = menuWindow;
            }

            var timeSettingVM = new TimeSetting();
            TimeSpan selectedDuration = TimeSpan.Zero;

            // Abonăm evenimentul pentru a primi durata selectată
            timeSettingVM.TimeSet += duration =>
            {
                selectedDuration = duration;
            };

            var timeSettingWindow = new TimeSettingWindow
            {
                DataContext = timeSettingVM,
                Owner = parameter as Window
            };

            // Afișează fereastra ca dialog
            timeSettingWindow.ShowDialog();

            // Dacă utilizatorul nu a introdus o durată validă, putem seta o valoare implicită
            if (selectedDuration == TimeSpan.Zero)
            {
                selectedDuration = TimeSpan.FromMinutes(3);
            }

            // Creează GameViewModel-ul cu durata aleasă
            var gameViewModel = new Game(_user)
            {
                RemainingTime = selectedDuration
            };

            var gameWindow = new GameWindow
            {
                DataContext = gameViewModel,
                Owner = parameter as Window
            };

            gameWindow.Show();
            if(parameter is Window window)
            {
                window.Hide();
            }
        }



        private void OpenOptionsWindow(object parameter)
        {
            var optionsViewModel = new Options(_user);
            var optionsWindow = new OptionsWindow
            {
                DataContext = optionsViewModel,
                Owner = parameter as Window
            };
            optionsWindow.ShowDialog();
        }

        private void OpenAboutWindow(object parameter)
        {
            var aboutViewModel = new About();
            var aboutWindow = new AboutWindow
            {
                DataContext = aboutViewModel,
                Owner = parameter as Window
            };
            aboutWindow.ShowDialog();
        }

        private void ExitMenuWindow(object parameter)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            if (parameter is Window window)
            {
                window.Close();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
