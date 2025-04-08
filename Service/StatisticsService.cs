using MemoryGame.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

namespace MemoryGame.Service
{
    public static class StatisticsService
    {
        private static readonly string StatsFile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "statistics.json");

        public static async Task<List<PlayerStatistics>> LoadStatisticsAsync()
        {
            if (!File.Exists(StatsFile))
                return new List<PlayerStatistics>();

            string json = await File.ReadAllTextAsync(StatsFile);
            return JsonSerializer.Deserialize<List<PlayerStatistics>>(json);
        }

        public static async Task SaveStatisticsAsync(List<PlayerStatistics> stats)
        {
            var options = new JsonSerializerOptions { WriteIndented = true };
            string json = JsonSerializer.Serialize(stats, options);
            await File.WriteAllTextAsync(StatsFile, json);
        }

        public static async Task UpdateStatisticsAsync(PlayerStatistics statUpdate)
        {
            var stats = await LoadStatisticsAsync();
            var existing = stats.FirstOrDefault(s => s.UserId == statUpdate.UserId);
            if (existing != null)
            {
                existing.GamesPlayed = statUpdate.GamesPlayed;
                existing.GamesWon = statUpdate.GamesWon;
            }
            else
            {
                stats.Add(statUpdate);
            }
            await SaveStatisticsAsync(stats);
        }

        public static async Task RemoveStatisticsAsync(int userId)
        {
            var stats = await LoadStatisticsAsync();
            var statToRemove = stats.FirstOrDefault(s => s.UserId == userId);
            if (statToRemove != null)
            {
                stats.Remove(statToRemove);
                await SaveStatisticsAsync(stats);
            }
        }
    }
}
