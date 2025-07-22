org 0000h
	
again:  mov a,#00h          ;Initialize Accumulator
back:   mov p1,a            ;Move the content of Accumulator to Port 1
        inc a               ;Increment the Accumulator
        cjne a,#0ffh,back   ;Compare the content of Accumulator to #0FFH, jump tp "b1" if the content is not #0FFH
	sjmp again          ;Run the program indefinitely

end
