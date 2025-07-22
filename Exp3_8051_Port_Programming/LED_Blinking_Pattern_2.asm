org 0000h
	mov p1,#00h
	setb c
	mov a,#00h
	again: mov p1,a
	cpl c
	rlc a
	acall delay
	sjmp again 
	
	delay: mov r0,#01h
	l2: mov r1,#01h
	l1: mov r2,#01h
	here: djnz r2,here
	djnz r1,l1
	djnz r0,l2
	ret
	
	end
