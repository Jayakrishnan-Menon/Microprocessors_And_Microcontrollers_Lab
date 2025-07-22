//Timer with 250 microsec on and 50 microsec off
org 0000h

        mov tmod,#10h   ;Declare the usage of Timer 1 in mode 1
again:  mov th1,#0feh   ;Load #0FEH to the Higher Byte of Timer 1
	mov tl1,#036h   ;Load #036H to the Lower Byte of Timer 1
	setb p1.0       ;Set the state of the pin to high to generate the positive part of the waveform
	setb tr1        ;Start the Timer 1 to run
here:   jnb tf1,here    ;Monitor the Flag for Timer 1 till it sets. Continue execution after it sets to 1
	clr tf1         ;Clear the Timer Flag
	clr tr1         ;Clear the Run Flag
	mov th1,#0ffh   ;Load #0FFH to the Higher Byte of Timer 1
	mov tl1,#0a4h   ;Load #0A4H to the Lower Byte of Timer 1
	clr p1.0        ;Clear the state of the pin to low to generate the negative part of the waveform
	setb tr1        ;Start the Timer 1 to run
here1:  jnb tf1,here1   ;Monitor the Flag for Timer 1 till it sets. Continue execution after it sets to 1
	clr tf1         ;Clear the Timer Flag
	clr tr1         ;Clear the Run Flag
	sjmp again      ;Run the program indefinitely

end
