   M S B A M L   `   `   `  ����E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:MemoryGame.ViewModelMemoryGame.ViewModel  5   	   !    MemoryGame.View.LoginWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   4local"clr-namespace:MemoryGame.ViewModel     5   	     � Title$  Login Window��5   	   $	��600��6   $	��800��6+    � WindowStartupLocation$ CenterScreen=�5   	   ��5      
� 5   
   .��5	      �  � Color$ 	#FF102C46��6    � Offset$ 0Q�6-   � 5
      $ 	#FF174365��6   $ 1Q�6-   5       � 	Resources 5          MemoryGame.ViewModel.Login   loginVM  RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius��%�  &	        &	        5   
   6   �� 5   
   " ��6+   .�5      ��  � �� �#FF5A5A6+   �� 5       � ��
 �����6+   �� 5       � ��$ 14(�6)   �� 5       � ��
 ���� 6,   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $	 15��5   !   ._�5      �� $��Center=�6/   $��Center=�5   /   5      5      5      5       5!      .��5"      � $��10q�6   
 � DataContext#
 [  6    � RowDefinitions 5#   
   �� 5$      $
��Auto �6   �� 5%      $��* �6   �� 5&      $
��Auto �6   .+�5)   
   �� $��Welcome! Enjoy this game!��6   $��22(�5*      $
��Bold"�5+      $��Center=�5,      $��0,0,0,10q�5-      
�������5.      � 50   
   $��1��6    � ColumnDefinitions 51      �� 52      $��2* �6#   �� 53      $��3* �6#   .+�56      �� $��0��6   $��0,0,10,0q�6)   .+�57      �� $��Alege un utilizator:��6   $��15(�58      $
��Bold"�59      $��0,0,0,5q�5:      
���������5<      �� 5=       j� Stretch$
 Fill=�6%   5?      �� 5@      -   5        $��UserListBox��5@      $	��250��6-   $��0,0,0,10q�6:   
���������5A      �� *Users+ �� SelectedItem 5B      �� *SelectedUser+ �� Mode$ TwoWay=���5C      �� 5D      ��5F      �� 5G      ��5I      �� 5J      .R�5K      ��  �� Orientation$ 
Horizontal=�6)   $	��0,5q�6B   .+�5L   "   �� $��15(�5M      $��0,0,5,0q�5N      ��5L   ,   �� *	FirstName+5N      �� 5O   "   $��15(�5P      ��5O   ,   �� *
LastName+5P      5Q      5R      5U      �� 5V      $ 
Horizontal=�6   $
��Left=�66   .+�5W      �� $��New User��6   $��	20,0,20,0q�5X      $	��120��5Y      $��40��5Z      #��[ 5[      ��5\      �� *NewUserCommand+�� 5]      $��Delete User��6   $��0,0,20,0q�5^      $	��120��5_      #��[ 5`      ��5a      �� *DeleteUserCommand+5b      5c      �� 5e      $��1��6   $��Center=�6)   $��Center=�6F   �� 5f      $��Uniform=�6   $��1��5g   E   $��
13,8,2,157q�6U   ��6   �� *SelectedUser.ProfileImage+6U   5h      �� 5j   
   $��2��6   $ 
Horizontal=�6"   $��Center=�6;   $��0,10,0,0q�6X   .+�5k      �� $
��Play��6   $	��150��6$   $��50��60   #��[ 5l      $��0,0,10,0q�5m      ��5n      �� *StartGameCommand+��5o      ��  �� RelativeSource ��  �� AncestorType" ��� 5p      $��Close��6   $	��150��6%   $��50��61   #��[ 5q      ��5r      �� *ExitCommand+5s      5t      5u      