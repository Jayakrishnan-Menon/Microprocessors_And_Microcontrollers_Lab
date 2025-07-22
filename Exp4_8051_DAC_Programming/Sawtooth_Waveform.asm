org 0000h
	
again:  mov a,#00h
back:   mov p1,a
        inc a
	
        cjne a,#0ffh,back
back1:  mov p1,a
	dec a
	cjne a,#00h,back1
	sjmp again

end
