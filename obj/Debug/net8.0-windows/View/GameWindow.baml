   M S B A M L   `   `   `  ����E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MemoryGame.ServiceMemoryGame.Service  5   	        MemoryGame.View.GameWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   2local clr-namespace:MemoryGame.Service     5   	     � Title$  New Game��5   	   $	��600��6   $	��800��6'    � WindowStartupLocation$ CenterScreen=�5   	   +  %MemoryGame.Service.MessageBoxBehavior   GameOverMessage 5   	   �� *GameOverMessage+��5      
� 5	   
   .��5
      �  � Color$ 	#FF102C46��6    � Offset$ 0Q�6-   � 5      $ 	#FF174365��6   $ 1Q�6-   5       � 	Resources 5      5   /MemoryGame.Service.StringToImageSourceConverter    StringToImageSourceConverter5   /MemoryGame.Service.BooleanToVisibilityConverter   BooleanToVisibilityConverter  RoundedButtonStyle �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� CornerRadius �� Padding��%"  &	        &	      &	 &       5   
   6-     5   
   6-   �� 5   
   " ��6+   .�5      ��  � �� �#FF5A5A6+   �� 5       � ��
 �����6+   �� 5       � ��$ 14(�6)   �� 5       � ��
 ���� 6,   �� 5       �@�Cursor$
 Hand��6'   �� 5       � ��$ 5q�6'   �� 5       � �� 5      �� 5      "	 ��6&   .R�5      �� #��z��6!   $
 25��5      $ 10q�5      ._�5      �� $��Center=�6/   $��Center=�5   '   5       5!      5#      5$      5%      .��5&      � .+�5'   
   �  � ColumnDefinitions 5(      �� 5)      $
��Auto �6#   �� 5*      $��* �6#   �� 5+      $
��Auto �6#   .+�5-      �� $��0��6   $
��Exit��5.      #��[ 51      $
��Left=�52      $	��Top=�60   $��10q�53      $��80��6!   $��40��6,   ��5/      �� *ExitGameCommand+��50      ��  �� RelativeSource ��  �� AncestorType
 Window53   ,   �� 54      $��1��6   $
��Save��55      #��[ 58      $��Right=�59      $	��Top=�61   $��10q�5:      $��80��6!   $��40��6,   ��56      �� *SaveGameCommand+��57      ��  �� 
 Window5:   ,   5;      ]� 5=   
   $��0,50,0,0q�6   .+�5>      �� $��20(�5?      $
��Bold"�5@      $	��Top=�5A      $��Center=�5B      $��10q�5C      
���������5>      �� *RemainingTime+5D      �� 5E      ��6   �� *Cards+��5F      �� 5G      .R�5H      A�  A� Rows 5I      �� *DataContext.BoardRows+ ��  ItemsControl A� Columns 5J      �� *DataContext.BoardColumns+ ��  ItemsControl5K      ��5M      �� 5N      .R�5O      �� $��5q�5Q   !   ��5O   !   �� *!DataContext.CardSelectedCommand+ �� 
 Window��5P   !   �� .��5R      � .+�5S   "   �� ��5T   &   �� 5U   *   " ��60   .�5V   .   ��  � ��$Q KC:\Facultate\An 2\Semestrul 2\MAP\MemoryGame\MemoryGame\Images\backside.jpg��6G    �� Triggers 5W   .   �� 5X   2    �� Binding 6>   �� *	IsFlipped+ �� Value True6\   .a�5Y   6   ��  � �� 6O   �� *Image+5Z   3   �� 5[   2    6>   �� *	IsMatched+ True6\   .a�5\   6   ��  � y�$ 	Collapsed=�6S   5]   3   5_   +   5a   #   5b      5c      5d      5f      5g      � 5i   
   ���	#80000000y�5j      �� *	IsLoading+ �� 	Converter# [ .+�5k      �� $��Center=�6   $��Center=�66   .+�5l      �  � IsIndeterminate$
 True��6   $	��200��65   $��20��6A   �� 5m      $��Se incarca...��6   
�������$��Center=�5o      $��10q�5p      5q      5r      5s      5t      