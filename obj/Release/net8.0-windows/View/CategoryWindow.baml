   M S B A M L   `   `   `  ���� E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MemoryGame.ServiceMemoryGame.Service  $    MemoryGame.View.CategoryWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     1conv clr-namespace:MemoryGame.Service       � Title$  Select Category��$	��300��$	��300�� � WindowStartupLocation$ CenterOwner=���
� .���  � Color$ 	#FF102C46�� � Offset$ 0Q�� $ 	#FF174365��$ 1Q� � 	Resources /   )MemoryGame.Service.EnumToBooleanConverter   EnumToBooleanConverter  RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%  &	        &	        �� " ��.���  � �� �#FF5A5A��  � ��
 �������  � ��$ 14(���  � ��
 ���� ��  �@�Cursor$
 Hand����  � ��$ 5q���  � �� �� " ��.R��� #��z��$	 25��$
 10q�._��� $��Center=�$��Center=�.��� $��10q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* �.+��� $��0��$��Select a Category��$��20(�$
��Bold"�$��Center=�$��0,0,0,10q��� $��1��$��10q�.+�	� $
��Cars�� 	� 	GroupName$ CategoryGroup��
������� d� 	IsChecked �� *SelectedCategory+ �� 	Converter# [   �� ConverterParameter$
 Cars��	� $��	Buildings��$ CategoryGroup��
������� �� *SelectedCategory+# [  $ 	Buildings��	� $��Animals��$ CategoryGroup��
������� �� *SelectedCategory+# [  $ Animals���� $��2��$
��Save��$	��100��$��Center=�#��[ ���� *SaveCategoryCommand+����  �� RelativeSource ��  �� AncestorType
 Window