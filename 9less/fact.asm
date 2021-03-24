%include "st_io.inc"
global _start
section .data
n db 3
section .text

fct:
mov bx,1
mov ax,1 
l:
mul bx
inc bx
loop l
UNSINT eax
ret

_start:
mov cl, [n]
call fct
PUTCHAR 0xA
FINISH
