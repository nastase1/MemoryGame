   M S B A M L   `   `   `  ����E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MemoryGame.ServiceMemoryGame.Service  5   	   $    MemoryGame.View.CategoryWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   1conv clr-namespace:MemoryGame.Service     5   	     � Title$  Select Category��5   	   $	��300��6!   $	��300��6.    � WindowStartupLocation$ CenterOwner=�5   	   ��5      
� 5   
   .��5	      �  � Color$ 	#FF102C46��6    � Offset$ 0Q�6-   � 5
      $ 	#FF174365��6   $ 1Q�6-   5       � 	Resources 5      /   )MemoryGame.Service.EnumToBooleanConverter   EnumToBooleanConverter  RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%  &	        &	        5   
   6&   �� 5   
   " ��6+   .�5      ��  � �� �#FF5A5A6+   �� 5       � ��
 �����6+   �� 5       � ��$ 14(�6)   �� 5       � ��
 ���� 6,   �� 5       �@�Cursor$
 Hand��6'   �� 5       � ��$ 5q�6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $	 25��5   !   $
 10q�5   !   ._�5      �� $��Center=�6/   $��Center=�5   /   5      5      5!      5"      5#      .��5%      � $��10q�6    � RowDefinitions 5&   
   �� 5'      $
��Auto �6   �� 5(      $
��Auto �6   �� 5)      $
��Auto �6   �� 5*      $��* �6   .+�5-   
   �� $��0��6   $��Select a Category��6!   $��20(�5.      $
��Bold"�6"   $��Center=�5/      $��0,0,0,10q�61   �� 51   
   $��1��6   $��10q�6"   .+�52      	� $
��Cars��6    	� 	GroupName$ CategoryGroup��6)   
������� d� 	IsChecked 53      �� *SelectedCategory+ �� 	Converter# [   �� ConverterParameter$
 Cars��6�   	� 54      $��	Buildings��6   $ CategoryGroup��6.   
������� 55      �� *SelectedCategory+# [  $ 	Buildings��6�   	� 56      $��Animals��6   $ CategoryGroup��6,   
������� 57      �� *SelectedCategory+# [  $ Animals��6�   58      �� 5:   
   $��2��6   $
��Save��6   $	��100��6-   $��Center=�5;      #��[ 5<      ��5=      �� *SaveCategoryCommand+��5>      ��  �� RelativeSource ��  �� AncestorType
 Window5?      5@      