   M S B A M L   `   `   `  ����E  AMemoryGame, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:MemoryGame.ServiceMemoryGame.Service  5   	   !    MemoryGame.View.AboutWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   0beh clr-namespace:MemoryGame.Service     5   	     � Title$  About��5   	   $	��250��6   $	��400��6$    � WindowStartupLocation$ CenterScreen=�5   	   ��5      
� 5   
   .��5	      �  � Color$ 	#FF102C46��6    � Offset$ 0Q�6-   � 5
      $ 	#FF174365��6   $ 1Q�6-   5       � 	Resources 5         RoundedButtonStyle �� 
TargetType �� Property �� Value �� 
TargetType	 �� CornerRadius
 �� Padding��%�  &	        �� 5   
   " ��6+   .�5      ��  � �� �#FF5A5A6+   �� 5       � ��
 �����6+   �� 5       � ��$ 14(�6)   �� 5       � ��
 ���� 6,   �� 5       �@�Cursor$
 Hand��6'   �� 5       � ��$ 5q�6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� #��z��6!   $	 25��5      $
 10q�5      ._�5      �� $��Center=�6/   $��Center=�5   '   5      5      5       5!      5"      .��5#      � .+�5$   
   �� $��20q�6   $��Center=�6!   .+�5%      �� $��20(�5&      $
��Bold"�5'      
�������$��Center=�5)      $��0,0,0,10q�65   ��5%      �� *StudentName+5)   5   �� 5*      $��Center=�6   $��0,0,0,10q�65   �� 5+      ��6   �� *Email+1   +MemoryGame.Service.HyperlinkCommandBehavior   Command 5,      �� *OpenEmailCommand+.�6^   .�5-      �� 
����ح�$��	Underline{�5/       ��5-       �� *Email+5/       50      51      �� 52      $��16(�53      
�������$��Center=�55      $��0,0,0,5q�65   ��52      �� *GroupNumber+55   5   �� 56      $��16(�57      
�������$��Center=�59      $��0,0,0,15q�65   ��56      �� *Specialization+59   5   �� 5:      $��Close��6   $	��100��5;      $��Center=�5<      #��[  5=      ��5>      �� *CloseWindowCommand+��5?      ��  �� RelativeSource ��  �� AncestorType
 Window5@      5A      5B      