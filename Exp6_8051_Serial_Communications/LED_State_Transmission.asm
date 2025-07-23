;Serial communication LEDON LEDOFF
;Write a program to monitor the state of an LED connected to Pin 0 of Port 1 and use Serial Communication to transmit its ON or OFF state continuously

org 0000h                     ;Main Program begins here
	mov tmod,#20h         ;Declare the usage of Timer 1 in mode 2
	mov th1,#0fdh         ;Initialize the Higher Byte of T0 to #0fdh for auto reload
	mov scon,#50h         ;Enable 8-bit UART and Enable Reception using the scon register
	setb tr1              ;Start the Timer 1 to run
again:	jb p1.0,LEDON         ;Monitor the State of the LED at Pin 0 of Port 1. Go to "LEDON" of it is set. Execute the next line if it is not set

	mov dptr,#message2    ;Point the Data Pointer Register to the location of message2 which is located in the code memory
l2:     clr a                 ;Clear the Accumulator
	movc a,@a+dptr        ;Move the Byte pointed to by the DPTR and offset by the value in the Accumulator to the Accumulator (Indexed Addressing)
	jz exit1              ;Observe the Byte loaded in the Accumulator. If it is a String termination character "\0", then jump to "exit1". Else continue execution of the lext line
	acall serial          ;Call the subroutine used for serial UART communication to Transmit the data
	inc dptr              ;Point dptr ot the next location in the code memory
	sjmp l2               ;Continue iterating through the message till the entire message is transmitted 
exit1:  sjmp again            ;Once the String termination character is reached, monitor the LED again and continue execution indifinitely

LEDON:  mov dptr,#message1    ;Point the Data Pointer Register to the location of message1 which is located in the code memory
l1:     clr a                 ;Clear the Accumulator
	movc a,@a+dptr        ;Move the Byte pointed to by the DPTR and offset by the value in the Accumulator to the Accumulator (Indexed Addressing)
	jz exit2              ;Observe the Byte loaded in the Accumulator. If it is a String termination character "\0", then jump to "exit2". Else continue execution of the lext line
	acall serial          ;Call the subroutine used for serial UART communication to Transmit the data
	inc dptr              ;Point dptr ot the next location in the code memory
	sjmp l1               ;Continue iterating through the message till the entire message is transmitted 
exit2:  sjmp again            ;Once the String termination character is reached, monitor the LED again and continue execution indifinitely
	
serial:                       ;Subroutine for Serial Communication
        mov sbuf,a            ;Move the Character in the Accumulator to the sbuf register for transmitting
here:   jnb ti,here           ;Wait here till transmission is completed and the Transmission flag is set
	clr ti                ;Clear the transmission flag to prepare before the next character is sent
	ret                   ;Return to executing the main program
	
org 0300h                     ;Storing of Messages happens here
message1: db ' LEDON ',0      ;
message2: db ' LEDOFF ',0     ;
				
end
