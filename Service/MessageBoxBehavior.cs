using MemoryGame.Model;
using MemoryGame.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using MemoryGame.ViewModel;

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
            System.Diagnostics.Debug.WriteLine($"OnGameOverMessageChanged: {e.NewValue}");

            if (d is Window window && e.NewValue is string message && !string.IsNullOrWhiteSpace(message))
            {
                System.Diagnostics.Debug.WriteLine($"Showing message box: {message}");
                MessageBox.Show(message, "Game Over", MessageBoxButton.OK, MessageBoxImage.Information);

                System.Diagnostics.Debug.WriteLine("Closing window");
                window.Close();

                if (Application.Current.Properties["MenuWindow"] is Window menuWindow)
                {
                    System.Diagnostics.Debug.WriteLine("Showing stored menu window");
                    if (!menuWindow.IsVisible)
                        menuWindow.Show();
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Creating new menu window");
                    var currentUser = Application.Current.Properties["CurrentUser"] as User;
                    var newMenuWindow = new MenuWindow
                    {
                        DataContext = new Menu(currentUser)
                    };
                    Application.Current.Properties["MenuWindow"] = newMenuWindow;
                    newMenuWindow.Show();
                }
            }
        }

    }
}
