;Write a program to use the T0 of 8051 as an 8-bit counter. Display the count at Port 1

org 0000h

	mov tmod,#06h    ;Declare the usage of Timer 0 as a mode 2 counter
        mov th0,#00h     ;Initialize the Higher Byte of T0 to auto reload
        mov tl0,#00h     ;Initialize the Lower Byte of T0
	setb p3.4        ;Set Pin 4 of Port 3 of high state so that T0 is enabled to receive external pulses
	setb tr0         ;Start the Timer 0 to run
again:	
l1:     mov a,tl0        ;Move the count value to the Accumulator from the 8-bit T0
	mov p1,a         ;Move the count value to Port 1 from the Accumulator
	jnb tf0,l1       ;Monitor the Flag for Timer 0 till it sets. Execute the next instruction after it sets to 1. Else jump to "l1" for displaying the count value
	clr tf0          ;Clear the Timer Flag
	sjmp again       ;Run the program indefinitely
	
end
