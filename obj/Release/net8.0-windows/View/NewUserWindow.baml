   M S B A M L   `   `   `  ����   
MemoryGame#    MemoryGame.View.NewUserWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$  New User��$	��400��$	��300�� � WindowStartupLocation$ CenterScreen=���
� .���  � Color$ 	#FF102C46�� � Offset$ 0Q�� $ 	#FF174365��$ 1Q� � 	Resources    RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%  &	        �� " ��.���  � �� �#FF5A5A��  � ��
 �������  � ��$ 14(���  � ��
 ���� ��  �@�Cursor$
 Hand����  � ��$ 5q���  � �� �� " ��.R��� #��z��$	 25��$
 10q�._��� $��Center=�$��Center=�.��� $��10q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+���  �� Orientation$ 
Horizontal=�$��0��$��0,0,0,5q�.+��� $��Nume:��$��60��$��Center=�
��������� $	��200������ *	FirstName+ �� UpdateSourceTrigger$ PropertyChanged=��� $ 
Horizontal=�$��1��$��0,0,0,5q�.+��� $��Prenume:��$��60��$��Center=�
��������� $	��200������ *
LastName+$ PropertyChanged=��� $��2��$��Imagine:��$��0,0,0,5q�
��������� $��3��$��Center=�.+��� -   $��	UserImage��$	��100��$	��100��$��Uniform=�$��0,0,0,5q����� *	UserImage+�� $��Încarcă poza��#��[  $	��150��$��40��$��Center=����� *UploadImageCommand+�� $��4��$
��SAVE��$	��100��$��40��$��Center=�$��0,10,0,0q�#��[  ���� *SaveNewUserCommand+����  �� RelativeSource ��  �� AncestorType
 Window