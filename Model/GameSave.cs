using MemoryGame.Model;
using System;
using System.Collections.Generic;

namespace MemoryGame.Model
{
    public class GameSave
    {
        public int UserId { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }

        public int BoardRows { get; set; }
        public int BoardColumns { get; set; }

        public ImageCategory Category { get; set; }

        public TimeSpan RemainingTime { get; set; }

        public TimeSpan ElapsedTime { get; set; }

        public List<Card> Cards { get; set; }
    }
}
