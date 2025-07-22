;Finding the Average
;In the data memory,load 10 bytes from 40H to 49H with some hexadecimal valuesoad the hex value from 40H in the data memory to the Accumulatoroad the hex value from 40H in the data memory to the Accumulator

org 0000h
        mov r0,#40h	;R0 will be used as a Pointer to the data memory at 40H
	mov r2,#0ah	;Average of 10 values is computed
	mov r3,#00h	;R3 stores the number of values iterated through and is used later on in division
	mov a,#00h	;Initialize the Accumulator	
here:   mov b,@r0	;Move the data being pointed at by R0 to the B register
	add a,b		;Add a with b and store the result in a
	inc r3		 ;Increment R3 value before the next iteration
label : inc r0		 ;Increment the pointer to point to the next Byte
	djnz r2,here 	   ;Till R1 becomes #00H continue looping and iterating through the data memory
	mov b,r3	   ;Move the number of bytes to B register for the upcoming division operation
	div ab		 ;Perform the Division operation
end

;The Quotient and Remainder in hexadeciaml will be found in the Accumulator and B register respectively
