;Generate a square wave with 75% duty cycle on P1.0

 org 0000h

	clr p1.0       ;Initialize P1.0

again:  setb p1.0      ;Set P1.0
	acall delay    ;
	acall delay    ;
	acall delay    ;Call the delay thrice to achieve the 75% duty cycle
	
        clr p1.0       ;Clear P1.0
	acall delay    ;Call the delay once for the 25% duty cycle
	sjmp again     ;Run the program indefinitely
	
delay:  mov r0,#0ffh   ;Nested DJNZ Loops for implementing a delay
l1:     mov r1,#0ffh   ;
here:   djnz r1,here   ;
	djnz r0,l1     ;
	ret            ;Call ends here and cpu returns to executing the main program
	
end

;Although the program allows you to achieve rational duty cycles, accurate time periods for the ON and OFF times are difficult to achieve 
