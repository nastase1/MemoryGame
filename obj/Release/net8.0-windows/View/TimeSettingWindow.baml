   M S B A M L   `   `   `  ���� E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:MemoryGame.ViewMemoryGame.View  '    !MemoryGame.View.TimeSettingWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     /localclr-namespace:MemoryGame.View       � Title$  Set Game Time��$	��200��$	��300�� � WindowStartupLocation$ CenterScreen=���
� .���  � Color$ 	#FF102C46�� � Offset$ 0Q�� $ 	#FF174365��$ 1Q� � 	Resources    RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%  &	        �� " ��.���  � �� �#FF5A5A��  � ��
 �������  � ��$ 14(���  � ��
 ���� ��  �@�Cursor$
 Hand����  � ��$ 5q���  � �� �� " ��.R��� #��z��$	 25��$
 10q�._��� $��Center=�$��Center=�.��� $��10q� � RowDefinitions �� $
��Auto ��� $
��Auto �.+��� .+��� $��Input the time (m:ss):��$��16(�$��0,0,0,10q�
��������� $��16(�$��Stretch=����� *	TimeInput+ �� UpdateSourceTrigger$ PropertyChanged=��� $��OK��#��[  $	��100��$��40��$��Center=�$��1��$��0,20,0,0q����� *	OkCommand+����  �� RelativeSource ��  �� AncestorType
 Window