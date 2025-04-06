using MemoryGame.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace MemoryGame.Service
{
    class MessageBoxBehavior
    {
        public static readonly DependencyProperty GameOverMessageProperty =
            DependencyProperty.RegisterAttached(
                "GameOverMessage",
                typeof(string),
                typeof(MessageBoxBehavior),
                new PropertyMetadata(null, OnGameOverMessageChanged));

        public static void SetGameOverMessage(DependencyObject element, string value)
        {
            element.SetValue(GameOverMessageProperty, value);
        }

        public static string GetGameOverMessage(DependencyObject element)
        {
            return (string)element.GetValue(GameOverMessageProperty);
        }

        private static void OnGameOverMessageChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is Window window && e.NewValue is string message && !string.IsNullOrWhiteSpace(message))
            {
                // Afișăm mesajul
                MessageBox.Show(message, "Game Over", MessageBoxButton.OK, MessageBoxImage.Information);
                // Închidem fereastra
                window.Close();

                if (Application.Current.Properties["MenuWindow"] is Window menuWindow)
                {
                    menuWindow.Show();
                }
                else
                {
                    // Dacă nu avem referința, creăm totuși un nou MenuWindow (ca backup)
                    var newMenuWindow = new MenuWindow();
                    newMenuWindow.Show();
                }
            }
        }
    }
}
