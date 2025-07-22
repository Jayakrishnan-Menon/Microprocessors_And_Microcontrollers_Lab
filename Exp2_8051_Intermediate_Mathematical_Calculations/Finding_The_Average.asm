;Finding the Average
;In the data memory,load 10 bytes from 40H to 49H with some hexadecimal valuesoad the hex value from 40H in the data memory to the Accumulatoroad the hex value from 40H in the data memory to the Accumulator

org 0000h
        mov r0,#40h	;R0 will be used as a Pointer to the data memory at 40H
	mov r2,#0ah	;Average of 10 values is computed
	mov r3,#00h	;R3 stores the number of values iterated through and is used later on in division
	mov a,#00h	
here:   mov b,@r0
	jnb b.0,label
	add a,b
	inc r3
label : inc r0
	djnz r2,here
	mov b,r3
	div ab
end

;The Quotient and Remainder in hexadeciaml will be found in the Accumulator and B register respectively
