   M S B A M L   `   `   `  ���� E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MemoryGame.ServiceMemoryGame.Service       MemoryGame.View.GameWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     2local clr-namespace:MemoryGame.Service       � Title$  New Game��$	��600��$	��800�� � WindowStartupLocation$ CenterScreen=�+  %MemoryGame.Service.MessageBoxBehavior   GameOverMessage �� *GameOverMessage+��
� .���  � Color$ 	#FF102C46�� � Offset$ 0Q�� $ 	#FF174365��$ 1Q� � 	Resources 5   /MemoryGame.Service.StringToImageSourceConverter    StringToImageSourceConverter5   /MemoryGame.Service.BooleanToVisibilityConverter   BooleanToVisibilityConverter  RoundedButtonStyle �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� CornerRadius �� Padding��%)  &	        &	      &	 
         �� " ��.���  � �� �#FF5A5A��  � ��
 �������  � ��$ 14(���  � ��
 ���� ��  �@�Cursor$
 Hand����  � ��$ 5q���  � �� �� "	 ��.R��� #��z��$
 25��$ 10q�._��� $��Center=�$��Center=�.��� .+��  � ColumnDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��$
��Exit��#��[ $
��Left=�$	��Top=�$��10q�$��80��$��40������ *ExitGameCommand+����  �� RelativeSource ��  �� AncestorType
 Window�� $��1��$
��Save��#��[ $��Right=�$	��Top=�$��10q�$��80��$��40������ *SaveGameCommand+����  �� 
 Window]� $��0,50,0,0q�.+��� $��20(�$
��Bold"�$	��Top=�$��Center=�$��10q�
����������� *RemainingTime+�� ���� *Cards+���� .R�A�  A� Rows �� *DataContext.BoardRows+ ��  ItemsControl A� Columns �� *DataContext.BoardColumns+ ��  ItemsControl���� .R��� $��5q����� *!DataContext.CardSelectedCommand+ �� 
 Window���� .��� .+��� ���� " ��.���  � ��$Q KC:\Facultate\An 2\Semestrul 2\MAP\MemoryGame\MemoryGame\Images\backside.jpg�� �� Triggers ��  �� Binding �� *	IsFlipped+ �� Value True.a���  � �� �� *Image+��  �� *	IsMatched+ True.a���  � y�$ 	Collapsed=�� ���	#80000000y��� *	IsLoading+ �� 	Converter# [ .+��� $��Center=�$��Center=�.+��  � IsIndeterminate$
 True��$	��200��$��20���� $��Se incarca...��
�������$��Center=�$��10q�