$regfile = "attiny2313.dat"
$crystal = 4000000
$hwstack = 16

Config Portd.6 = Output                                     'LED

Config Portb.7 = Output                                     'L1
Config Portb.6 = Output                                     'L2
Config Portb.5 = Output                                     'L3
Config Portb.4 = Output                                     'L4

Config Portd.3 = Input                                      'dir
Config Portd.2 = Input                                      'step
Config Portd.0 = Input                                      'enable

Config Portd.4 = Output                                     'OPCJA set
Config Portd.5 = Input                                      'opcja odczyt

Config Int0 = Falling

Declare Sub Ustawx
Declare Sub Resetuj


Dim I As Word
Dim X As Byte
Dim Status As Bit

Enable Int0
On Int0 Posuw


X = 1
I = 0

Enable Interrupts

Do
     If Pind.0 = 1 Then
      I = I + 1
      If I = 180 Then
      Gosub Resetuj
      End If
      Wait 1
     Else
      Gosub Resetuj
     End If
Loop

Posuw:
   I = 0
   If Pind.3 = 0 Then
      X = X + 1
      Gosub Ustawx
   Else
      X = X - 1
      Gosub Ustawx
   End If
Return

Sub Ustawx
   Set Portd.6
      If X = 0 Then
            X = 8
      End If
      If X = 9 Then
         X = 1
      End If
    Select Case X
      Case 1:
         Set Portb.7
         Reset Portb.6
         Reset Portb.5
         Reset Portb.4
      Case 2:
         Set Portb.7
         Set Portb.6
         Reset Portb.5
         Reset Portb.4
      Case 3:
         Reset Portb.7
         Set Portb.6
         Reset Portb.5
         Reset Portb.4
      Case 4:
         Reset Portb.7
         Set Portb.6
         Set Portb.5
         Reset Portb.4
      Case 5:
         Reset Portb.7
         Reset Portb.6
         Set Portb.5
         Reset Portb.4
      Case 6:
         Reset Portb.7
         Reset Portb.6
         Set Portb.5
         Set Portb.4
      Case 7:
         Reset Portb.7
         Reset Portb.6
         Reset Portb.5
         Set Portb.4
      Case 8:
         Set Portb.7
         Reset Portb.6
         Reset Portb.5
         Set Portb.4
      End Select
End Sub

Sub Resetuj
         Reset Portd.6
         Reset Portb.7
         Reset Portb.6
         Reset Portb.5
         Reset Portb.4
         Status = 0
End Sub

