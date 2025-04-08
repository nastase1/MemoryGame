using MemoryGame.Model;
using System;
using System.IO;
using System.Text.Json;
using System.Threading.Tasks;

namespace MemoryGame.Service
{
    public static class GameSaveService
    {
        // Folderul în care se salvează jocurile
        private static readonly string SaveFolder = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Saves");

        static GameSaveService()
        {
            if (!Directory.Exists(SaveFolder))
                Directory.CreateDirectory(SaveFolder);
        }

        // Metodă pentru a salva jocul; decizi dacă vrei să suprascrii sau să creezi fișiere separate
        public static async Task SaveGameAsync(GameSave gameSave)
        {
            // Exemplu: nume de fișier pe baza ID-ului jucătorului (suprascrie fiecare joc salvat de jucător)
            string fileName = Path.Combine(SaveFolder, $"GameSave_{gameSave.UserId}.json");

            var options = new JsonSerializerOptions
            {
                WriteIndented = true
            };

            string json = JsonSerializer.Serialize(gameSave, options);
            await File.WriteAllTextAsync(fileName, json);
        }

        // Metodă pentru a încărca un joc salvat pentru un anumit jucător
        public static async Task<GameSave> LoadGameAsync(int userId)
        {
            string fileName = Path.Combine(SaveFolder, $"GameSave_{userId}.json");

            if (!File.Exists(fileName))
                return null;

            string json = await File.ReadAllTextAsync(fileName);
            return JsonSerializer.Deserialize<GameSave>(json);
        }
    }
}
