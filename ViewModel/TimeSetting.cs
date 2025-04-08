using MemoryGame.Service;
using System;
using System.ComponentModel;
using System.Windows;
using System.Windows.Input;

namespace MemoryGame.ViewModel
{
    public class TimeSetting : INotifyPropertyChanged
    {
        private string _timeInput;
        public string TimeInput
        {
            get => _timeInput;
            set
            {
                _timeInput = value;
                OnPropertyChanged(nameof(TimeInput));
            }
        }

        public ICommand OkCommand { get; }

        public event Action<TimeSpan> TimeSet;

        public TimeSetting()
        {
            TimeInput = "3:00";
            OkCommand = new RelayCommand(Ok);
        }

        private void Ok(object parameter)
        {
            if (ParseTimeInput(TimeInput, out TimeSpan duration))
            {
                TimeSet?.Invoke(duration);

                if (parameter is Window window)
                    window.Close();
            }
            else
            {
                MessageBox.Show("The time format should be m:ss (for example, 2:50).",
                                "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private bool ParseTimeInput(string input, out TimeSpan duration)
        {
            var parts = input.Split(':');
            if (parts.Length == 2 &&
                int.TryParse(parts[0], out int minutes) &&
                int.TryParse(parts[1], out int seconds))
            {
                duration = new TimeSpan(0, minutes, seconds);
                return true;
            }
            duration = TimeSpan.Zero;
            return false;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
