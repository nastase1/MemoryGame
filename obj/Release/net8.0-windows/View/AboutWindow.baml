   M S B A M L   `   `   `  ���� E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MemoryGame.ServiceMemoryGame.Service  !    MemoryGame.View.AboutWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     0beh clr-namespace:MemoryGame.Service       � Title$  About��$	��250��$	��400�� � WindowStartupLocation$ CenterScreen=���
� .���  � Color$ 	#FF102C46�� � Offset$ 0Q�� $ 	#FF174365��$ 1Q� � 	Resources    RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%  &	        �� " ��.���  � �� �#FF5A5A��  � ��
 �������  � ��$ 14(���  � ��
 ���� ��  �@�Cursor$
 Hand����  � ��$ 5q���  � �� �� " ��.R��� #��z��$	 25��$
 10q�._��� $��Center=�$��Center=�.��� .+��� $��20q�$��Center=�.+��� $��20(�$
��Bold"�
�������$��Center=�$��0,0,0,10q����� *StudentName+�� $��Center=�$��0,0,0,10q��� ���� *Email+1   +MemoryGame.Service.HyperlinkCommandBehavior   Command �� *OpenEmailCommand+.�.��� 
����ح�$��	Underline{����� *Email+�� $��16(�
�������$��Center=�$��0,0,0,5q����� *GroupNumber+�� $��16(�
�������$��Center=�$��0,0,0,15q����� *Specialization+�� $��Close��$	��100��$��Center=�#��[  ���� *CloseWindowCommand+����  �� RelativeSource ��  �� AncestorType
 Window