;Smallest number
;In the data memory,load 5 bytes from 40H to 44H with some hexadecimal values

org 0000h
	mov a,40h
	mov r0,#41h
	mov r1,#04h
here:	mov b,@r0
	cjne a,b,label
	sjmp next
label:	jc next
	xch a,b
next:	inc r0
	djnz r1,here
end

;The smallest hexadeciaml value will be found in the accumulator
