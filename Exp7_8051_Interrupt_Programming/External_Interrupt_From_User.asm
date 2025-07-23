;LED interrupting

ORG 0000H             ;Main Program
        SJMP 0030H    ;Leaving Spaccce for Hardware Interrupts
ORG 0030H             ;Continue the Main Program from here
	MOV P1,#00H   ;Declare Port 1 as Output
	SETB TCON.2   ;
	MOV IE ,#84H  ;
	SETB P1.5     ;
AGAIN:  MOV R0,#0fH   ;
L1:	MOV R1,#01H   ;
HERE:   DJNZ R1,HERE  ;
	DJNZ R0,L1    ;
	CPL P1.5      ;
	SJMP AGAIN    ;
                
ORG 0013H             ;
	SJMP 0050H    ;
ORG 0050H             ;
	CLR P1.5      ;
	SETB P1.0     ;
	MOV R0,#0fH   ;
L2:	MOV R1,#01H   ;
HERE1:  DJNZ R1,HERE1 ;
	DJNZ R0,L2    ;
	CLR P1.0      ;
	RETI          ;

END
