// 16 bit subtraction
org 0000h
	mov a,#10h
	mov b,#21h
	subb a,b
	mov r0,a
	mov a,#12h
	mov b,#01h
	subb a,b
	mov r1,a
	end
