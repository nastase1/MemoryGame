   M S B A M L   `   `   `  ���� E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:MemoryGame.ViewModelMemoryGame.ViewModel  7 clr-namespace:MemoryGame.ServiceMemoryGame.Service  #    MemoryGame.View.OptionsWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     4local"clr-namespace:MemoryGame.ViewModel     1conv clr-namespace:MemoryGame.Service       � Title$  Options��$	��300��$	��400�� � WindowStartupLocation$ CenterScreen=���
� .���  � Color$ 	#FF102C46�� � Offset$ 0Q�� $ 	#FF174365��$ 1Q� � 	Resources /   )MemoryGame.Service.EnumToBooleanConverter   EnumBooleanConverter2  ,MemoryGame.Service.CustomVisibilityConverter  CustomVisibilityConverter  RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%)  &	        &	      &	 
         �� " ��.���  � �� �#FF5A5A��  � ��
 �������  � ��$ 14(���  � ��
 ���� ��  �@�Cursor$
 Hand����  � ��$ 5q���  � �� �� " ��.R��� #��z��$	 25��$
 10q�._��� $��Center=�$��Center=�.���� $��10q�.+��� $��Select board type:��$
��Bold"�$��0,0,0,10q�
���������  �� Orientation$ 
Horizontal=�$��0,0,0,10q�.+�	� $��Standard (4x4)��$��0,0,20,0q�
������� d� 	IsChecked �� *SelectedBoardType+ �� 	Converter# [   �� ConverterParameter$ Standard��	� $��Custom��
������� �� *SelectedBoardType+# [  $ Custom���� $��10q�y��� *SelectedBoardType+# [ .+��� $ 
Horizontal=�$��0,0,0,5q�.+��� $��Rows:��$��50��
��������� $��50������ *Rows+ �� UpdateSourceTrigger$ PropertyChanged=��� $ 
Horizontal=�.+��� $��Columns:��$��50��
��������� $��50������ *	Columns+$ PropertyChanged=��� $��Save Options��#��[ $	��150��$��40��$��Center=�$��10q����� *SaveOptionsCommand+����  �� RelativeSource ��  �� AncestorType
 Window