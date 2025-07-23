;Serial communication LEDON LEDOFF
org 0000h
	mov tmod ,#20h
	mov th1,#0fdh
	mov scon,#50h
	setb tr1
again:	jb p1.0,LEDON

	mov dptr,#message2
l2:     clr a
	movc a,@a+dptr
	jz exit1
	acall serial
	inc dptr
	sjmp l2
exit1:  sjmp again

LEDON:  mov dptr,#message1
l1:     clr a
	movc a,@a+dptr
	jz exit2
	acall serial
	inc dptr
	sjmp l1
exit2:  sjmp again
	
serial: mov sbuf,a
here:   jnb ti,here
	clr ti
	ret
	
org 0300h
message1: db ' LEDON ',0
message2: db ' LEDOFF ',0
				
end
