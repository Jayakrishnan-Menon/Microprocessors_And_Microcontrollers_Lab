org 0000h
	again: mov a,#00h
	b1: mov p1,a
	inc a
	cjne a,#0ffh,b1
	b2: mov p1,a
	dec a
	cjne a,#0ffh,b2
	sjmp again
end
