global _start
%include "st_io.inc"
section .data
 a db  "*"
 b dd  450  
 d dd -14
section .text
_start:
	PRINT "Hello, world!"
	PUTCHAR 0xA
	mov al, [a]
	PUTCHAR al
	PUTCHAR 0xA
	GETCHAR 
	PRINT "YOUR TEXT is: "	
	PUTCHAR al
	PUTCHAR 0xA
	mov eax, [b]
	UNSINT eax
	PUTCHAR 0xA
	mov eax, [d]
	SIGNINT eax
	PUTCHAR 0xA
FINISH

