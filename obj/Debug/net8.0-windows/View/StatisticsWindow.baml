   M S B A M L   `   `   `  ����  
MemoryGame&     MemoryGame.View.StatisticsWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  Player Statistics��5   	   $	��400��6#   $	��600��60    � WindowStartupLocation$ CenterScreen=�5   	   ��5      
� 5   
   .��5      �  � Color$ 	#FF102C46��6    � Offset$ 0Q�6-   � 5	      $ 	#FF174365��6   $ 1Q�6-   5
       � 	Resources 5         RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%�  &	        �� 5   
   " ��6+   .�5      ��  � �� �#FF5A5A6+   �� 5       � ��
 �����6+   �� 5       � ��$ 14(�6)   �� 5       � ��
 ���� 6,   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $	 15��5   !   $
 10q�5   !   ._�5      �� $��Center=�6/   $��Center=�5   /   5      5      5      5      5       .��5!      ]� .+�5#   
   �� $��Player Statistics��6   $��18(�5$      $
��Bold"�5%      
�������$��10q�5'      $	��Top=�5(      $��Center=�5)      &   System.Windows.Controls.DataGrid  5+   
      AutoGenerateColumns$ False��5,         CanUserAddRows$ False��5-      $��10q�5.      $	��Top=�5/         
IsReadOnly$
 True��50      ��5+      �� *
Statistics+   Columns 51      0  *System.Windows.Controls.DataGridTextColumn  52      ,  &System.Windows.Controls.DataGridColumn   Header$
 User��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6P   1  +System.Windows.Controls.DataGridBoundColumn   Binding 63   �� *
UserName+6P     53      $ Games Played��6%   $ * 6[    6;   �� *GamesPlayed+6[     54      $ 	Games Won��6%   $ * 6U    68   �� *
GamesWon+6U   56      �� 58   
   $��Bottom=�6    �� Orientation$ 
Horizontal=�6-   $��Center=�6F   $��10q�6c   .+�59      �� -   5        $
��Exit��59      #��[  5:      $��80��5;      $��40��5<      5=      5>      5?      5@      