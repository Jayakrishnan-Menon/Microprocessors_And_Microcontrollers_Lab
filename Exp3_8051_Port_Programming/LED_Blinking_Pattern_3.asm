;Blink leds connected to port p1 one after the another in such a mannar:
; 1 0 0 0 0 0 0 1
; 0 1 0 0 0 0 1 0
; 0 0 1 0 0 1 0 0
; 0 0 0 1 1 0 0 0
; 1 0 0 0 0 0 0 1

org 0000h
again:  mov p1,#00000000b    ;
	      acall delay          ;
	      mov p1,#10000001b    ; 
	      acall delay          ;
	      mov p1,#00000000b    ;
	      acall delay          ;
	      mov p1,#01000010b    ;
	      acall delay          ;
	      mov p1,#00000000b    ;
	      acall delay          ;
	      mov p1,#00100100b    ;
	      acall delay          ;
	      mov p1,#00000000b    ;
	      acall delay          ;
	      mov p1,#00011000b    ;
	      acall delay          ;
	      sjmp again           ;
	
delay:  mov r0,#0ffh         ;Nested DJNZ Loops for implementing a delay
l2:     mov r1,#0ffh         ;
l1:     mov r2,#0ffh         ;
here:   djnz r2,here         ;
	      djnz r1,l1           ;
	      djnz r0,l2           ;
	      ret                  ;Call ends here and cpu returns to executing the main program
	
end

;It is self explanatory how the patterns will appear on the port... a delay is additionally added to make the pattern visible to the human eye 
