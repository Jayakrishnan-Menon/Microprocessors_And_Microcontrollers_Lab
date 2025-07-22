;Generate a square wave with 75% duty cycle on P1.0

 org 0000h

	clr p1.0
again:  setb p1.0
	acall delay
	acall delay
	acall delay
	clr p1.0
	acall delay
	sjmp again
	
delay:  mov r0,#0ffh
l1:     mov r1,#0ffh
here:   djnz r1,here
	djnz r0,l1
	ret
	
	end
