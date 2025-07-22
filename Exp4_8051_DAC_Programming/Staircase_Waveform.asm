org 0000h

again: mov a,#00h          ;
back:  mov p1,a            ;
	     acall delay         ;
	     add a,#64d          ;
	     cjne a,#0ffh,back   ;
	     sjmp again          ;

delay: mov r0,#0ffh        ;
h2:    mov r1,#0ah         ;
h1:    djnz r1,h1          ;
	     djnz r0,h2          ;
	     ret                 ;

end
