   M S B A M L   `   `   `  ����E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:MemoryGame.ViewModelMemoryGame.ViewModel  5   	        MemoryGame.View.MenuWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:MemoryGame.ViewModel     5   	     � Title$  
MenuWindow��5   	   $	��600��6   $	��800��6)    � WindowStartupLocation$ CenterScreen=�5	   	   ��5
      
� 5   
   .��5      �  � Color$ 	#FF102C46��6    � Offset$ 0Q�6-   � 5      $ 	#FF174365��6   $ 1Q�6-   5       � 	Resources 5        MemoryGame.ViewModel.Menu 
  menuVM  RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%  &	        &	        5   
   6   �� 5   
   " ��6+   .�5      ��  � �� �#FF5A5A6+   �� 5       � ��
 �����6+   �� 5       � ��$ 18(�6)   �� 5       � ��
 ���� 6,   �� 5       �@�Cursor$
 Hand��6'   �� 5       � ��$ 5q�6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $	 25��5   !   $
 10q�5   !   ._�5      �� $��Center=�6/   $��Center=�5    /   5!      5"      5$      5%      5&      .��5'      �  � RowDefinitions 5(   
   �� 5)      $
��Auto �6   �� 5*      $��* �6   .+�5-   
   �� $��0��6   $��Center=�5.      $��24(�5/      $
��Bold"�50      
�������$��	0,20,0,20q�52      ��53      `� 54       �� StringFormat$ Hello {0} {1}!��6   .1�55      ��  �� Path$ LastName�6   �� 56      $ 	FirstName�6   57      59      �� 5;   
   $��1��6   $��Center=�5<      $��Center=�5=      .+�5>      �� $��Category��6   $	��200��6(   #��[ 64   ��5?      �� *OpenCategoryCommand+��5@      ��  �� RelativeSource ��  �� AncestorType
 Window�� 5A      $��New Game��6   $	��200��6(   #��[ 64   ��5B      �� *NewGameCommand+��5C      ��  �� 
 Window�� 5D      $��	Open Game��6   $	��200��6)   #��[ 65   ��5E      �� *OpenGameCommand+��5F      ��  �� 
 Window�� 5G      $��
Statistics��6   $	��200��6*   #��[ 66   ��5H      �� *StatisticsCommand+��5I      ��  �� 
 Window�� 5J      $��Options��6   $	��200��6'   #��[ 63   ��5K      �� *OpenOptionsCommand+��5L      ��  �� 
 Window�� 5M      $��About��6   $	��200��6%   #��[ 61   ��5N      �� *OpenAboutCommand+��5O      ��  �� 
 Window�� 5P      $
��Back��6   $	��200��6$   #��[ 60   ��5Q      �� *ExitCommand+��5R      ��  �� " �5S      5T      5U      