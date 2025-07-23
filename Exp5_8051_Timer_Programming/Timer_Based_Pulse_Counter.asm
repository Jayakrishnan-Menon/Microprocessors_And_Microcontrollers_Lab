org 0000h

	mov tmod,#06h
        mov th0,#00h
        mov tl0,#00h
	setb p3.4
	setb tr0
again:	
l1:     mov a,tl0
	mov p1,a
	jnb tf0,l1
	clr tf0
	sjmp again
	
end
