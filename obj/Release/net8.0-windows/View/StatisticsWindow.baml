   M S B A M L   `   `   `  ����   
MemoryGame&     MemoryGame.View.StatisticsWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$  Player Statistics��$	��400��$	��600�� � WindowStartupLocation$ CenterScreen=���
� .���  � Color$ 	#FF102C46�� � Offset$ 0Q�� $ 	#FF174365��$ 1Q� � 	Resources    RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%�   &	        �� " ��.���  � �� �#FF5A5A��  � ��
 �������  � ��$ 14(���  � ��
 ���� ��  �@�Cursor$
 Hand����  � �� �� " ��.R��� #��z��$	 15��$
 10q�._��� $��Center=�$��Center=�.��]� .+��� $��Player Statistics��$��18(�$
��Bold"�
�������$��10q�$	��Top=�$��Center=�&   System.Windows.Controls.DataGrid     AutoGenerateColumns$ False��   CanUserAddRows$ False��$��10q�$	��Top=�   
IsReadOnly$
 True������ *
Statistics+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$
 User��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *
UserName+  $ Games Played��$ *  �� *GamesPlayed+  $ 	Games Won��$ *  �� *
GamesWon+�� $��Bottom=� �� Orientation$ 
Horizontal=�$��Center=�$��10q�.+��� -   $
��Exit��#��[  $��80��$��40��