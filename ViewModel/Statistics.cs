using MemoryGame.Model;
using MemoryGame.Service;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MemoryGame.ViewModel
{
    class StatisticsViewModel : INotifyPropertyChanged
    {
        public ObservableCollection<PlayerStatistics> Statistics { get; set; } = new ObservableCollection<PlayerStatistics>();

        public StatisticsViewModel()
        {
            LoadStatistics();
        }

        private async void LoadStatistics()
        {
            var statsList = await StatisticsService.LoadStatisticsAsync();
            Statistics.Clear();
            foreach (var stat in statsList)
            {
                Statistics.Add(stat);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void OnPropertyChanged(string propertyName) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
