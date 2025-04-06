using System;
using System.Globalization;
using System.Windows.Data;
using System.Windows.Media;

namespace MemoryGame.Service
{
    public class AvatarSelectionConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is int selectedIndex && parameter is int itemIndex)
            {
                return selectedIndex == itemIndex ? new SolidColorBrush(Colors.Orange) : new SolidColorBrush(Colors.Transparent);
            }
            return new SolidColorBrush(Colors.Transparent);
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}