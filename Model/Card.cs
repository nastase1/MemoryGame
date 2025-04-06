using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MemoryGame.Model
{
    public class Card : INotifyPropertyChanged
    {
        public int Id { get; set; }
        public string ImagePath { get; set; }
        private bool _isFlipped;
        public bool IsFlipped
        {
            get => _isFlipped;
            set { _isFlipped = value; OnPropertyChanged(nameof(IsFlipped)); }
        }

        private bool _isMatched;
        public bool IsMatched
        {
            get => _isMatched;
            set { _isMatched = value; OnPropertyChanged(nameof(IsMatched)); }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
