;Blink led connected to port p1 one after the another in such a mannar:
; 0 0 0 0 0 0 0 0
; 0 0 0 0 0 0 0 1
; 0 0 0 0 0 0 1 1
; 0 0 0 0 0 1 1 1
; 0 0 0 0 1 1 1 1
; 0 0 0 1 1 1 1 1
; 0 0 1 1 1 1 1 1
; 0 1 1 1 1 1 1 1
; 1 1 1 1 1 1 1 1
; 1 1 1 1 1 1 1 0
; 1 1 1 1 1 1 0 0
; 1 1 1 1 1 0 0 0
; 1 1 1 1 0 0 0 0
; 1 1 1 0 0 0 0 0
; 1 1 0 0 0 0 0 0
; 1 0 0 0 0 0 0 0
; 0 0 0 0 0 0 0 0
; 0 0 0 0 0 0 0 1

org 0000h
	mov p1,#00h  ;Declare Port 1 as output
	setb c       ;Set the carry
	mov a,#00h   ;Initialize the Accumulator

again:  mov p1,a     ;Move the value in Accumulator to Port 1
	cpl c        ;Complement the content of the carry bit in the PSW
	rlc a        ;Shift and Rotate Accumulator contents to the left through the carry bit in the PSW
	acall delay  ;Call a delay to make the led blinking visible to the human eye
	sjmp again   ;Run the program indefinitely
	
delay:  mov r0,#01h  ;Nested DJNZ Loops for implementing a delay
l2:     mov r1,#01h  ;
l1:     mov r2,#01h  ;
here:   djnz r2,here ;
	djnz r1,l1   ;
	djnz r0,l2   ;
	ret          ;Call ends here and cpu returns to executing the main program
end

