;Program to generate a square wave with 25us delay
;mode1, timer1, load FFE7 in T1

ORG 000H
	      MOV TMOD, #10H
AGAIN:	MOV TH1, #0FFH
	      MOV TL1, #0E7H
	      CPL P1.0
	      SETB TR1
HERE:	  JNB TF1, HERE
	      CLR TF1
	      CLR TR1
	      SJMP AGAIN
