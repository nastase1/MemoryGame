   M S B A M L   `   `   `  ����E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:MemoryGame.ViewModelMemoryGame.ViewModel  5   	   7 clr-namespace:MemoryGame.ServiceMemoryGame.Service  5   	   #    MemoryGame.View.OptionsWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   4local"clr-namespace:MemoryGame.ViewModel     5   	   1conv clr-namespace:MemoryGame.Service     5   	     � Title$  Options��5   	   $	��300��6   $	��400��6&    � WindowStartupLocation$ CenterScreen=�5   	   ��5      
� 5	   
   .��5
      �  � Color$ 	#FF102C46��6    � Offset$ 0Q�6-   � 5      $ 	#FF174365��6   $ 1Q�6-   5       � 	Resources 5      /   )MemoryGame.Service.EnumToBooleanConverter   EnumBooleanConverter2  ,MemoryGame.Service.CustomVisibilityConverter  CustomVisibilityConverter  RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%"  &	        &	      &	 &       5   
   6&     5   
   6)   �� 5   
   " ��6+   .�5      ��  � �� �#FF5A5A6+   �� 5       � ��
 �����6+   �� 5       � ��$ 14(�6)   �� 5       � ��
 ���� 6,   �� 5       �@�Cursor$
 Hand��6'   �� 5       � ��$ 5q�6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $	 25��5      $
 10q�5      ._�5      �� $��Center=�6/   $��Center=�5   '   5       5!      5#      5$      5%      .��5&      �� $��10q�6   .+�5'   
   �� $��Select board type:��6   $
��Bold"�6/   $��0,0,0,10q�6A   
�������6S   �� 5(   
    �� Orientation$ 
Horizontal=�6   $��0,0,0,10q�6.   .+�5)      	� $��Standard (4x4)��6   $��0,0,20,0q�5+      
������� d� 	IsChecked 5*      �� *SelectedBoardType+ �� 	Converter# [   �� ConverterParameter$ Standard��5+   ,   	� 5,      $��Custom��6   
������� 5-      �� *SelectedBoardType+# [  $ Custom��6�   5.      �� 5/   
   $��10q�6   y�6!   �� *SelectedBoardType+# [ .+�50      �� $ 
Horizontal=�6   $��0,0,0,5q�62   .+�51      �� $��Rows:��6   $��50��6)   
�������64   �� 52      $��50��6U   ��6   �� *Rows+ �� UpdateSourceTrigger$ PropertyChanged=�6U   53      �� 54      $ 
Horizontal=�6   .+�55      �� $��Columns:��6   $��50��6,   
�������67   �� 56      $��50��6X   ��6   �� *	Columns+$ PropertyChanged=�6X   57      58      �� 59   
   $��Save Options��6   #��[ 5:      $	��150��5=      $��40��6   $��Center=�6)   $��10q�6F   ��5;      �� *SaveOptionsCommand+��5<      ��  �� RelativeSource ��  �� AncestorType
 Window5=   F   5>      5?      