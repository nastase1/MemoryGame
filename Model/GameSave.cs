using MemoryGame.Model;
using System;
using System.Collections.Generic;

namespace MemoryGame.Model
{
    public class GameSave
    {
        // Identificatorul jucătorului care a salvat jocul
        public int UserId { get; set; }

        // Informații despre jucător (opțional, dacă vrei să salvezi și numele)
        public string FirstName { get; set; }
        public string LastName { get; set; }

        // Configurația tablei
        public int BoardRows { get; set; }
        public int BoardColumns { get; set; }

        // Categoria imaginilor
        public ImageCategory Category { get; set; }

        // Timpul rămas până la finalul jocului
        public TimeSpan RemainingTime { get; set; }

        // Timpul scurs de la începutul jocului până la momentul salvarii
        public TimeSpan ElapsedTime { get; set; }

        // (Opțional) Poți salva și starea cardurilor, de exemplu lista de carduri cu proprietățile IsFlipped/IsMatched
        public List<Card> Cards { get; set; }
    }
}
