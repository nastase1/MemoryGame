   M S B A M L   `   `   `  ���� E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:MemoryGame.ViewModelMemoryGame.ViewModel       MemoryGame.View.MenuWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     4local"clr-namespace:MemoryGame.ViewModel       � Title$  
MenuWindow��$	��600��$	��800�� � WindowStartupLocation$ CenterScreen=���
� .���  � Color$ 	#FF102C46�� � Offset$ 0Q�� $ 	#FF174365��$ 1Q� � 	Resources   MemoryGame.ViewModel.Menu 
  menuVM  RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%  &	        &	        �� " ��.���  � �� �#FF5A5A��  � ��
 �������  � ��$ 18(���  � ��
 ���� ��  �@�Cursor$
 Hand����  � ��$ 5q���  � �� �� " ��.R��� #��z��$	 25��$
 10q�._��� $��Center=�$��Center=�.���  � RowDefinitions �� $
��Auto ��� $��* �.+��� $��0��$��Center=�$��24(�$
��Bold"�
�������$��	0,20,0,20q���`�  �� StringFormat$ Hello {0} {1}!��.1���  �� Path$ LastName��� $ 	FirstName��� $��1��$��Center=�$��Center=�.+��� $��Category��$	��200��#��[ ���� *OpenCategoryCommand+����  �� RelativeSource ��  �� AncestorType
 Window�� $��New Game��$	��200��#��[ ���� *NewGameCommand+����  �� 
 Window�� $��	Open Game��$	��200��#��[ ���� *OpenGameCommand+����  �� 
 Window�� $��
Statistics��$	��200��#��[ ���� *StatisticsCommand+����  �� 
 Window�� $��Options��$	��200��#��[ ���� *OpenOptionsCommand+����  �� 
 Window�� $��About��$	��200��#��[ ���� *OpenAboutCommand+����  �� 
 Window�� $
��Back��$	��200��#��[ ���� *ExitCommand+����  �� " �