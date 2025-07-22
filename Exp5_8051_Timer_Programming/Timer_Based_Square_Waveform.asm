;Program to generate a square wave with 25us delay
;mode1, timer1, load FFE7 in T1

ORG 0000H
	MOV TMOD, #10H  ;Declare the usage of Timer 1 in mode 1
AGAIN:	MOV TH1, #0FFH  ;Load #0FFH to the Higher Byte of Timer 1
	MOV TL1, #0E7H  ;Load #0E7H to the Lower Byte of Timer 1
	CPL P1.0        ;Complement the state of the pin to toggle the wave
	SETB TR1        ;Start the Timer 1 to run
HERE:	JNB TF1, HERE   ;Monitor the Flag for Timer 1 till it sets. Continue execution after it sets to 1
	CLR TF1         ;Clear the Timer Flag
	CLR TR1         ;Clear the Run Flag
	SJMP AGAIN      ;Run the program indefinitely
