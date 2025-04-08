using MemoryGame.Model;
using MemoryGame.Service;
using MemoryGame.View;
using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media.Imaging;
using System.Windows.Threading;

namespace MemoryGame.ViewModel
{
    public class Game : INotifyPropertyChanged
    {
        public ObservableCollection<Card> Cards { get; set; } = new ObservableCollection<Card>();

        public event Action<bool> GameOver;
        public async Task EndGame(bool isWin)
        {
            System.Diagnostics.Debug.WriteLine($"EndGame called with isWin: {isWin}");
            if (_gameTimer != null)
            {
                _gameTimer.Stop();
                _gameTimer.Tick -= GameTimer_Tick;
                _gameTimer = null;
            }
            GameOverMessage = isWin ? "You've won" : "The time has expired: you lost!";
            OnPropertyChanged(nameof(GameOverMessage));
            GameOver?.Invoke(isWin);

            await UpdatePlayerStatisticsAsync(isWin);
        }

        private string _gameOverMessage;
        public string GameOverMessage
        {
            get => _gameOverMessage;
            set
            {
                _gameOverMessage = value;
                OnPropertyChanged(nameof(GameOverMessage));
            }
        }

        private bool _isLoading;
        public bool IsLoading
        {
            get => _isLoading;
            set { _isLoading = value; OnPropertyChanged(nameof(IsLoading)); }
        }

        public int BoardRows { get; set; }
        public int BoardColumns { get; set; }

        private bool _isBusy = false;
        private readonly Random _random = new Random();
        private DispatcherTimer _gameTimer;
        private TimeSpan _remainingTime;
        public TimeSpan RemainingTime
        {
            get => _remainingTime;
            set { _remainingTime = value; OnPropertyChanged(nameof(RemainingTime)); }
        }

        public Card _firstSelectedCard;
        public Card _secondSelectedCard;

        public ICommand CardSelectedCommand { get; }
        public ICommand ExitGameCommand { get; }
        public ICommand SaveGameCommand { get; }

        private User _user;

        public Game(User user, bool isLoadedGame = false)
        {
            _user = user;
            Application.Current.Properties["CurrentUser"] = user;

            try
            {
                BoardRows = user.BoardRows;
                BoardColumns = user.BoardColumns;
                if(!isLoadedGame)
                    InitializeCardsAsync(user.Category, user.BoardRows, user.BoardColumns);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error initializing cards: " + ex.Message);
                throw;
            }

            if(!isLoadedGame)
                RemainingTime = TimeSpan.FromMinutes(3);

            _gameTimer = new DispatcherTimer { Interval = TimeSpan.FromSeconds(1) };
            _gameTimer.Tick += GameTimer_Tick;

            CardSelectedCommand = new RelayCommand(CardSelected);
            ExitGameCommand = new RelayCommand(ExitGame);
            SaveGameCommand = new RelayCommand(async (param) => await SaveGame(param));
            

        }

        public void StartTimer()
        {
            if (_gameTimer != null && !_gameTimer.IsEnabled)
            {
                _gameTimer.Start();
            }
        }

        private void GameTimer_Tick(object sender, EventArgs e)
        {
            if (RemainingTime.TotalSeconds > 0)
            {
                RemainingTime = RemainingTime.Subtract(TimeSpan.FromSeconds(1));
            }
            else
            {
                _gameTimer.Stop();
                if (Cards.Any(c => !c.IsMatched))
                {
                    EndGame(false);
                }
            }
        }

        private async void InitializeCardsAsync(ImageCategory category, int rows, int columns)
        {
            IsLoading = true;
            await Task.Run(() =>
            {
                int totalCards = rows * columns;
                int pairsNeeded = totalCards / 2;
                string baseDir = AppDomain.CurrentDomain.BaseDirectory;
                string categoryPath = Path.Combine(baseDir, "Images", category.ToString());
                var allImages = Directory.GetFiles(categoryPath, "*.jpg")
                    .Concat(Directory.GetFiles(categoryPath, "*.png"))
                    .ToArray();
                var selectedImages = allImages.OrderBy(_ => _random.Next()).Take(pairsNeeded).ToList();
                var cardList = selectedImages.SelectMany(imagePath =>
                {
                    var image = new BitmapImage();
                    image.BeginInit();
                    image.UriSource = new Uri(imagePath, UriKind.Absolute);
                    image.CacheOption = BitmapCacheOption.OnLoad;
                    image.EndInit();
                    image.Freeze();
                    return new[]
                    {
                        new Card { ImagePath = imagePath, Image = image, IsFlipped = false, IsMatched = false },
                        new Card { ImagePath = imagePath, Image = image, IsFlipped = false, IsMatched = false }
                    };
                }).ToList();
                cardList = cardList.OrderBy(_ => _random.Next()).ToList();
                Application.Current.Dispatcher.Invoke(() =>
                {
                    foreach (var card in cardList)
                    {
                        Cards.Add(card);
                    }
                });
            });
            IsLoading = false;
            _gameTimer.Start();
        }

        private async void CardSelected(object parameter)
        {
            if (_isBusy || !(parameter is Card selectedCard) || selectedCard.IsFlipped || selectedCard.IsMatched)
                return;

            selectedCard.IsFlipped = true;

            if (_firstSelectedCard == null)
            {
                _firstSelectedCard = selectedCard;
            }
            else if (_secondSelectedCard == null)
            {
                _secondSelectedCard = selectedCard;
                _isBusy = true;

                if (_firstSelectedCard.ImagePath == _secondSelectedCard.ImagePath)
                {
                    await Task.Delay(300);
                    _firstSelectedCard.IsMatched = true;
                    _secondSelectedCard.IsMatched = true;
                }
                else
                {
                    await Task.Delay(700);
                    _firstSelectedCard.IsFlipped = false;
                    _secondSelectedCard.IsFlipped = false;
                }

                _firstSelectedCard = null;
                _secondSelectedCard = null;
                _isBusy = false;

                if (Cards.All(c => c.IsMatched))
                {
                    EndGame(true);
                }
            }
        }

        public async Task SaveCurrentGameAsync(TimeSpan elapsedTime)
        {
            var gameSave = new GameSave
            {
                UserId = _user.Id,
                FirstName = _user.FirstName,
                LastName = _user.LastName,
                BoardRows = BoardRows,
                BoardColumns = BoardColumns,
                Category = _user.Category,
                RemainingTime = this.RemainingTime,
                ElapsedTime = elapsedTime,
                Cards = this.Cards.ToList()
            };

            await GameSaveService.SaveGameAsync(gameSave);
        }

        private void ExitGame(object parameter)
        {
            if (parameter is Window gameWindow)
            {
                var menuWindow = Application.Current.Properties["MenuWindow"] as Window;
                if (menuWindow == null)
                {
                    menuWindow = new MenuWindow
                    {
                        DataContext = new Menu(_user)
                    };
                    Application.Current.Properties["MenuWindow"] = menuWindow;
                }
                _gameTimer.Stop();
                menuWindow.Show();
                gameWindow.Close();
            }
        }


        private async Task SaveGame(object parameter)
        {
            try
            {
                await SaveCurrentGameAsync(TimeSpan.Zero);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error saving game: " + ex.Message, "Save Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            await Task.Delay(100);
            ExitGame(parameter);
        }

        private async Task UpdatePlayerStatisticsAsync(bool isWin)
        {
            var stats = await StatisticsService.LoadStatisticsAsync();
            var currentStats = stats.FirstOrDefault(s => s.UserId == _user.Id);
            if (currentStats == null)
            {
                currentStats = new PlayerStatistics
                {
                    UserId = _user.Id,
                    UserName = _user.FirstName + " " + _user.LastName,
                    GamesPlayed = 0,
                    GamesWon = 0
                };
            }
            currentStats.GamesPlayed++;
            if (isWin)
                currentStats.GamesWon++;
            await StatisticsService.UpdateStatisticsAsync(currentStats);
        }


        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
