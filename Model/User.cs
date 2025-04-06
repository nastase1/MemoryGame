using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;
using System.Text.Json.Serialization;

namespace MemoryGame.Model
{
    public class User
    {

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string ProfileImagePath { get; set; }

        public BoardType BoardType { get; set; }
        public int BoardRows { get; set; }
        public int BoardColumns { get; set; }
        public ImageCategory Category { get; set; }

        [JsonIgnore]
        public BitmapImage ProfileImage
        {
            get
            {
                if (!string.IsNullOrEmpty(ProfileImagePath))
                    return new BitmapImage(new Uri(ProfileImagePath, UriKind.RelativeOrAbsolute));
                return null;
            }

        }


        public override string ToString() => $"{FirstName} {LastName}";
    }

}
