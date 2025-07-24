;Write a program to display some text on an LContinue the Main Program from hereCD when an interrupt occurs. display something else when no interrupt has occured 

ORG 0000H                    ;Program Begins
	SJMP 0030H           ;Leaving Space for Hardware Interrupts
ORG 0030H                    ;Continue the Main Program from here

;Main Program
	MOV IE, #10000100B   ;Set EA (Enable Access) bit and EX1 (Enable External Interrupt 1) bit
	SETB TCON.2          ;Set Interrupt Type 1 bit to enable Edge triggered External Interrupt
	MOV A, #38H          ;Command for 8 bit mode
	ACALL CMD            ;
	ACALL DLAY           ;
	MOV A, #0EH          ;Command to display on cursor on on
	ACALL CMD            ;
	ACALL DLAY           ;
	MOV A, #01H          ;Command to clear LCD
	ACALL CMD            ;
	ACALL DLAY           ;
Ag:	MOV A, #080H         ;Command to go to 1st line
	ACALL CMD            ;
	ACALL DLAY           ;
	MOV DPTR,#M1         ;Point DPTR to no interrupt message
	ACALL RTLCD          ;
	ACALL DLAY           ;
	MOV A, #0C0H         ;Command to go to 2nd line
	ACALL CMD            ;
	ACALL DLAY           ;
	MOV DPTR,#M1         ;Point DPTR to no interrupt message
	ACALL RTLCD          ;
	ACALL DLAY           ;
	ACALL DLAY           ;
	SJMP Ag              ;Run the program indefinitely

;Command Subroutine
CMD:    CLR P3.7             ;Clear RS
	CLR P3.6             ;Clear R/Wbar
	SETB P3.5            ;Enable High
	MOV P2, A            ;Send Command to Port 2
	ACALL DLAY           ;
	CLR P3.5             ;Enable Low
	RET                  ;Return to executing after call
;Data Subroutine             
DAT:    SETB P3.7            ;Set RS
	CLR P3.6             ;Clear R/Wbar
	SETB P3.5            ;Enable High
	MOV P2, A            ;Send Data to Port 2
	ACALL DLAY           ;
	CLR P3.5             ;Enable Low
	RET                  ;Return to executing after call

;Delay Subroutine
DLAY:                        ;Nested DJNZ Loops for implementing a delay subroutine
Back:   MOV R6, #01H         ;
Here:   DJNZ R6, Here        ;
	DJNZ R7, Back        ;
	RET                  ;Return to executing after call

;Return to LCD Subroutine
RTLCD:  NOP                  ;Before this make the dptr Point the Data Pointer Register to the location of message1 which is located in the code memory
L1:     CLR A                ;Clear the Accumulator
	MOVC A,@A+DPTR       ;Move the Byte pointed to by the DPTR and offset by the value in the Accumulator to the Accumulator (Indexed Addressing)
	JZ OVER              ;Observe the Byte loaded in the Accumulator. If it is a String termination character "\0", then jump to "OVER". Else continue execution of the lext line
	ACALL DAT            ;Call the data subroutine
	ACALL DLAY           ;Call the delay subroutine
	INC DPTR             ;Point dptr ot the next location in the code memory
	SJMP L1              ;Continue iterating through the message till the entire message is transmitted 
OVER:   RET                  ;Return to executing after call

;Messages
M1:DB '  NO INTERRUPT  ',0   ;Storing of Messages happens here
M2:DB '    INTERRUPT   ',0   ;
M3:DB '    OCCURED     ',0   ;

;Interrupt Handling 
ORG 0013H                    ;Vectored Interrupt Triggered
        LJMP 0200H           ;Jump to a location to leave Space for other Interrupts and avoid congestion
ORG 0200H                    ;Continue with the Interrupt Subroutine
        MOV A, #080H         ;Command to go to 1st line
	LCALL CMD            ;
	LCALL DLAY           ;
	MOV DPTR,#M2         ;Point DPTR to no interrupt occured message
	LCALL RTLCD          ;
	LCALL DLAY           ;
	MOV A, #0C0H         ;Command to go to 2nd line
	LCALL CMD            ;
	LCALL DLAY           ;
	MOV DPTR,#M3         ;Point DPTR to no interrupt occured message
	LCALL RTLCD          ;
	LCALL DLAY           ;
        RETI                 ;Return to executing after call

END
