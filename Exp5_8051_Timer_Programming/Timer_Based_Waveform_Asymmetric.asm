//Timer with 250 microsec on and 50 microsec off
org 0000h

       mov tmod,#10h
again: mov th1,#0feh
	     mov tl1,#036h
	     setb p1.0
	     setb tr1
here:  jnb tf1,here
	     clr tf1
	     clr tr1
	     mov th1,#0ffh
	     mov tl1,#0a4h
	     clr p1.0
	     setb p1.0
	     setb tr1
here1: jnb tf1,here1
	     clr tf1
	     clr tr1
	     sjmp again

end
