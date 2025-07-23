;SQUARE WAVE LONGER THAN THE DELAY WHICH CAN BE GIVEN BY TIMERS ONLY MODE 1

ORG 0000H
	MOV TMOD, #10H   ;Declare the usage of Timer 1 in mode 1
	MOV P1, #00H     ;Declare Port 1 as Output Port
AGAIN:  MOV R0, #5D      ;Load the number of times you want the timer to run
	CPL P1.0         ;Complement the Pin 0 of Port 1 to Generate the Square waveform
L1:	MOV TH1, #00H    ;Load #00H to the Higher Byte of Timer 1
	MOV TL1, #00H    ;Load #00H to the Lower Byte of Timer 1
	SETB TR1         ;Start the Timer 1 to run
HERE:   JNB TF1, HERE    ;Monitor the Flag for Timer 1 till it sets. Continue execution after it sets to 1
	CLR TF1          ;Clear the Timer Flag
	CLR TR1          ;Clear the Run Flag
	DJNZ R0, L1      ;Loop over till you achieve the required number of timer runs
	SJMP AGAIN       ;Run the program indefinitely
END
