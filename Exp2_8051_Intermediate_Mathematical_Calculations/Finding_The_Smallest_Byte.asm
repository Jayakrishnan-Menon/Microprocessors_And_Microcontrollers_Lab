;Smallest number
;In the data memory,load 5 bytes from 40H to 44H with some hexadecimal values

org 0000h
	mov a,40h	  ;Load the hex value from 40H in the data memory to the Accumulator
	mov r0,#41h	;R0 will be used as a Pointer to the data memory at 41H
	mov r1,#04h	;4 loaded here for comparison among 5 values
here:	mov b,@r0	     ;Move the data being pointed at by R0 to the B register
	cjne a,b,label	;Compare the values in Accumulator and B registers, jump to "label" if they are not equal, here if a<b, carry is set, if a>b, carry is cleared
	sjmp next	     ;This line executes if the values in Accumulator and B registers are equal
label:	jc next		;If a<b, jump to "next", else continue with the upcoming instruction
	xch a,b		;Since a>b because the carry was set, exchange the values in a and b to store the lower value in a
next:	inc r0		;Increment the pointer to point to the next Byte
	djnz r1,here	;Till R1 becomes #00H continue looping and iterating through the data memory
end

;The smallest hexadeciaml value will be found in the accumulator
;More numbers can be compared by loading a higher value in r0 and loading more bytes into the memory. 
