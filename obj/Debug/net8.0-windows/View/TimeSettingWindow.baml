   M S B A M L   `   `   `  ����E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:MemoryGame.ViewMemoryGame.View  5   	   '    !MemoryGame.View.TimeSettingWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:MemoryGame.View     5   	     � Title$  Set Game Time��5      $	��200��6   $	��300��6+    � WindowStartupLocation$ CenterScreen=�5	   	   ��5
      
� 5   
   .��5      �  � Color$ 	#FF102C46��6    � Offset$ 0Q�6-   � 5      $ 	#FF174365��6   $ 1Q�6-   5       � 	Resources 5         RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%�  &	        �� 5   
   " ��6+   .�5      ��  � �� �#FF5A5A6+   �� 5       � ��
 �����6+   �� 5       � ��$ 14(�6)   �� 5       � ��
 ���� 6,   �� 5       �@�Cursor$
 Hand��6'   �� 5       � ��$ 5q�6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $	 25��5      $
 10q�5      ._�5      �� $��Center=�6/   $��Center=�5   '   5       5!      5#      5$      5%      .��5&      � $��10q�6    � RowDefinitions 5'   
   �� 5(      $
��Auto �6   �� 5)      $
��Auto �6   .+�5+   
   �� .+�5,      �� $��Input the time (m:ss):��6   $��16(�5-      $��0,0,0,10q�5.      
�������6*   �� 5/      $��16(�50      $��Stretch=�51      ��5/      �� *	TimeInput+ �� UpdateSourceTrigger$ PropertyChanged=�51      52      �� 53   
   $��OK��6   #��[  56      $	��100��57      $��40��58      $��Center=�59      $��1��5:      $��0,20,0,0q�5;      ��54      �� *	OkCommand+��55      ��  �� RelativeSource ��  �� AncestorType
 Window5;      5<      5=      