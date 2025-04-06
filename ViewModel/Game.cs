using MemoryGame.Model;
using MemoryGame.Service;
using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Windows.Input;
using System.Windows.Threading;

namespace MemoryGame.ViewModel
{
    public class Game : INotifyPropertyChanged
    {
        public ObservableCollection<Card> Cards { get; set; } = new ObservableCollection<Card>();

        public event Action<bool> GameOver;
        private void EndGame(bool isWin)
        {
            if (_gameTimer != null)
            {
                _gameTimer.Stop();
                _gameTimer.Tick -= GameTimer_Tick; // Dezabonăm evenimentul
                _gameTimer = null;
            }
            // Setăm mesajul în funcție de rezultat
            GameOverMessage = isWin ? "Ai câștigat!" : "Timpul a expirat! Ai pierdut!";
            OnPropertyChanged(nameof(GameOverMessage));

            GameOver?.Invoke(isWin);
        }

        // Adăugăm proprietatea GameOverMessage
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

        private Card _firstSelectedCard;
        private Card _secondSelectedCard;

        public ICommand CardSelectedCommand { get; }

        public Game(User user)
        {
            try
            {
                BoardRows = user.BoardRows;
                BoardColumns = user.BoardColumns;
                InitializeCards(user.Category, user.BoardRows, user.BoardColumns);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Eroare la inițializarea cardurilor: " + ex.Message);
                throw;
            }

            // Exemplu: setăm un timp de joc (în minute) - poți să-l iei tot din user sau opțiuni
            RemainingTime = TimeSpan.FromMinutes(3);

            _gameTimer = new DispatcherTimer { Interval = TimeSpan.FromSeconds(1) };
            _gameTimer.Tick += GameTimer_Tick;
            _gameTimer.Start();

            CardSelectedCommand = new RelayCommand(CardSelected);
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
                // Dacă sunt cărți neîntâlnite, jocul se termină
                if (Cards.Any(c => !c.IsMatched))
                {
                    EndGame(false);
                }
            }
        }

        private void InitializeCards(ImageCategory category, int rows, int columns)
        {
            int totalCards = rows * columns;
            System.Diagnostics.Debug.WriteLine($"Total cards: {totalCards}");
            int pairsNeeded = totalCards / 2;

            // Construim calea spre folderul categoriei: ex. "Images/Animals"
            string baseDir = AppDomain.CurrentDomain.BaseDirectory;
            string categoryPath = Path.Combine(baseDir, "Images", category.ToString());
            System.Diagnostics.Debug.WriteLine($"Calea căutată: {categoryPath}");
            if (!Directory.Exists(categoryPath))
                throw new DirectoryNotFoundException($"Folderul '{categoryPath}' nu a fost găsit.");

            var allImages = Directory.GetFiles(categoryPath, "*.jpg")
                .Concat(Directory.GetFiles(categoryPath, "*.png"))
                .ToArray();
            System.Diagnostics.Debug.WriteLine($"Număr imagini găsite: {allImages.Length}");
            if (allImages.Length < pairsNeeded)
                throw new Exception($"Nu sunt suficiente imagini în folderul {categoryPath}. Sunt necesare cel puțin {pairsNeeded} imagini, dar au fost găsite {allImages.Length}.");

            var selectedImages = allImages
                .OrderBy(_ => _random.Next())
                .Take(pairsNeeded)
                .ToList();

            var cardList = selectedImages.SelectMany(image => new[] {
                new Card { ImagePath = image, IsFlipped = false, IsMatched = false },
                new Card { ImagePath = image, IsFlipped = false, IsMatched = false }
            }).ToList();

            cardList = cardList.OrderBy(_ => _random.Next()).ToList();

            foreach (var card in cardList)
            {
                Cards.Add(card);
            }
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
                _isBusy = true; // Blocăm interacțiunea pe parcursul comparării

                if (_firstSelectedCard.ImagePath == _secondSelectedCard.ImagePath)
                {
                    await System.Threading.Tasks.Task.Delay(300);
                    _firstSelectedCard.IsMatched = true;
                    _secondSelectedCard.IsMatched = true;
                }
                else
                {
                    await System.Threading.Tasks.Task.Delay(700);
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

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
