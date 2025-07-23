org 0000h

again:  mov a,#00h          ;Initialize Accumulator
back:   mov p1,a            ;Move the content of Accumulator to Port 1
	acall delay         ;Call a delay to form the steps
	add a,#64d          ;Increment the Accumulator in steps of #64D 
	cjne a,#0ffh,back   ;Until the Accumulator reaches #0FFH, continue stepping
	sjmp again          ;Run the program indefinitely

delay:  mov r0,#0ffh        ;Nested DJNZ Loops for implementing a delay subroutine
h2:     mov r1,#0ah         ;
h1:     djnz r1,h1          ;
	djnz r0,h2          ;
	ret                 ;Call ends here and cpu returns to executing the main program

end
