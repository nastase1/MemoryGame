   M S B A M L   `   `   `  ���� E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:MemoryGame.ViewModelMemoryGame.ViewModel  !    MemoryGame.View.LoginWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     4local"clr-namespace:MemoryGame.ViewModel       � Title$  Login Window��$	��600��$	��800�� � WindowStartupLocation$ CenterScreen=���
� .���  � Color$ 	#FF102C46�� � Offset$ 0Q�� $ 	#FF174365��$ 1Q� � 	Resources     MemoryGame.ViewModel.Login   loginVM  RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius��%�   &	        &	        �� " ��.���  � �� �#FF5A5A��  � ��
 �������  � ��$ 14(���  � ��
 ���� ��  �@�Cursor$
 Hand����  � �� �� " ��.R��� #��z��$	 15��._��� $��Center=�$��Center=�.��� $��10q�
 � DataContext#
 [   � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��Welcome! Enjoy this game!��$��22(�$
��Bold"�$��Center=�$��0,0,0,10q�
�������� $��1�� � ColumnDefinitions �� $��2* ��� $��3* �.+��� $��0��$��0,0,10,0q�.+��� $��Alege un utilizator:��$��15(�$
��Bold"�$��0,0,0,5q�
�����������  j� Stretch$
 Fill=��� -   $��UserListBox��$	��250��$��0,0,0,10q�
����������� *Users+ �� SelectedItem �� *SelectedUser+ �� Mode$ TwoWay=����� ���� ���� .R���  �� Orientation$ 
Horizontal=�$	��0,5q�.+��� $��15(�$��0,0,5,0q����� *	FirstName+�� $��15(����� *
LastName+�� $ 
Horizontal=�$
��Left=�.+��� $��New User��$��	20,0,20,0q�$	��120��$��40��#��[ ���� *NewUserCommand+�� $��Delete User��$��0,0,20,0q�$	��120��#��[ ���� *DeleteUserCommand+�� $��1��$��Center=�$��Center=��� $��Uniform=�$��1��$��
13,8,2,157q����� *SelectedUser.ProfileImage+�� $��2��$ 
Horizontal=�$��Center=�$��0,10,0,0q�.+��� $
��Play��$	��150��$��50��#��[ $��0,0,10,0q����� *StartGameCommand+����  �� RelativeSource ��  �� AncestorType" ��� $��Close��$	��150��$��50��#��[ ���� *ExitCommand+