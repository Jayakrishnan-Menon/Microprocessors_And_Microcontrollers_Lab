;LEDs and Interrupts
;Continuously blink the LED connected to Pin 5 of Port 1. Blink Pin 0 of Port 1 when the User Triggers External Interrupt 1 at Pin 3 of Port 3. 
;Make The Interrupt, Edge Triggered

ORG 0000H             ;Main Program
        SJMP 0030H    ;Leaving Space for Hardware Interrupts
ORG 0030H             ;Continue the Main Program from here
	MOV P1,#00H   ;Declare Port 1 as Output
	SETB TCON.2   ;Set Interrupt Type 1 bit to enable Edge triggered External Interrupt
	MOV IE ,#84H  ;Set EA (Enable Access) bit and EX1 (Enable External Interrupt 1) bit
	SETB P1.5     ;Turn ON the LED at Pin 5 of Port 1
AGAIN:  MOV R0,#0FH   ;Simple DJNZ Delay
L1:	MOV R1,#0FH   ;
HERE:   DJNZ R1,HERE  ;
	DJNZ R0,L1    ;
	CPL P1.5      ;Complement P1.5 to Blink LED
	SJMP AGAIN    ;Run the program indefinitely
                
ORG 0013H             ;Vectored Interrupt Triggered
	SJMP 0050H    ;Jump to a location to leave Space for other Interrupts and avoid congestion
ORG 0050H             ;Continue with the Interrupt Subroutine
	CLR P1.5      ;Turn the LED at P1.5 OFF
	SETB P1.0     ;Turn the LED at P1.0 ON
	MOV R0,#0FH   ;Simple DJNZ Delay
L2:	MOV R1,#0FH   ;
HERE1:  DJNZ R1,HERE1 ;
	DJNZ R0,L2    ;
	CLR P1.0      ;Turn the LED at P1.0 OFF
	RETI          ;Return after Executing the Interrupt Subroutine

END
