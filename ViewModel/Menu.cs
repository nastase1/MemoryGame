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
using System.Windows.Media.Imaging;
using MemoryGame.Service;

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
        public ICommand OpenGameCommand { get; }
        public ICommand StatisticsCommand { get; }

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
            OpenGameCommand = new RelayCommand(OpenGame);
            StatisticsCommand = new RelayCommand(OpenStatisticsWindow);
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

        private async void OpenGame(object parameter)
        {
            if (parameter is Window menuWindow)
            {
                // Salvează și ascunde fereastra de meniu
                Application.Current.Properties["MenuWindow"] = menuWindow;
                menuWindow.Hide();
            }

            var savedGame = await GameSaveService.LoadGameAsync(_user.Id);
            if (savedGame == null)
            {
                MessageBox.Show("No saved game found for this user.", "Open Game", MessageBoxButton.OK, MessageBoxImage.Information);
                if (parameter is Window menuWindow2)
                    menuWindow2.Show();
                return;
            }

            // Construiește view model-ul de joc din salvare
            var game = new Game(_user, true)
            {
                RemainingTime = savedGame.RemainingTime,
                BoardRows = savedGame.BoardRows,
                BoardColumns = savedGame.BoardColumns,
                IsLoading = true // Start with loading indicator active
            };

            // Create and show the game window first, while loading is in progress
            var gameWindow = new GameWindow
            {
                DataContext = game,
                Owner = parameter as Window
            };
            gameWindow.Show();

            // Now load the card images asynchronously
            await LoadSavedCardsAsync(game, savedGame);

            // After loading is complete, check win condition and start game
            var alreadyFlipped = game.Cards.Where(c => c.IsFlipped && !c.IsMatched).ToList();
            if (alreadyFlipped.Count == 1)
                game._firstSelectedCard = alreadyFlipped.First();
            else
                game._firstSelectedCard = null;

            // Check if all cards are matched
            if (game.Cards.All(c => c.IsMatched))
            {
                game.EndGame(true);
            }
            else
            {
                game.StartTimer();
            }

            // Loading finished
            game.IsLoading = false;
        }

        // Helper method to load cards asynchronously
        private async Task LoadSavedCardsAsync(Game game, GameSave savedGame)
        {
            await Task.Run(() =>
            {
                var loadedCards = new List<Card>();
                foreach (var card in savedGame.Cards)
                {
                    if (!string.IsNullOrEmpty(card.ImagePath))
                    {
                        var bitmap = new BitmapImage();
                        bitmap.BeginInit();
                        bitmap.UriSource = new Uri(card.ImagePath, UriKind.Absolute);
                        bitmap.CacheOption = BitmapCacheOption.OnLoad;
                        bitmap.EndInit();
                        bitmap.Freeze();
                        card.Image = bitmap;
                    }
                    loadedCards.Add(card);
                }

                // Update UI on the main thread
                Application.Current.Dispatcher.Invoke(() =>
                {
                    game.Cards.Clear();
                    foreach (var card in loadedCards)
                    {
                        game.Cards.Add(card);
                    }
                });
            });
        }

        private void OpenStatisticsWindow(object parameter)
        {
            var statisticsWindow = new StatisticsWindow
            {
                DataContext = new StatisticsViewModel(),
                Owner = parameter as Window
            };
            statisticsWindow.ShowDialog();
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
            var loginWindow = Application.Current.Properties["LoginWindow"] as Window;
            if (loginWindow != null)
            {
                loginWindow.Show();
            }
            if (parameter is Window window)
            {
                window.Close();
            }
        }


        public event PropertyChangedEventHandler PropertyChanged;
    }
}
