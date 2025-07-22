org 0000h

again:  mov a,#00h       ;Initialize Accumulator
b1:     mov p1,a         ;Move the content of Accumulator to Port 1
	inc a            ;Increment the Accumulator
	cjne a,#0ffh,b1  ;Compare the content of Accumulator to #0FFH, jump tp "b1" if the content is not #0FFH

b2:     mov p1,a         ;Move the content of Accumulator to Port 1
	dec a            ;Decrement the Accumulator
	cjne a,#00h,b2   ;Compare the content of Accumulator to #00H, jump tp "b2" if the content is not #00H
	sjmp again       ;Run the program indefinitely

end
