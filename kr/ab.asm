global _start
%include "st_io.inc"
section .data
a db 2
b db 7
c db 10 
section .text
_start:

mov eax, 0
mov al, byte[a]
mov bl, byte[b]
mov cl, byte[c]

cmp  al, cl
ja l

cmp bl, cl
ja n

PUTCHAR '3'
FINISH

l:
PUTCHAR '1' 
FINISH

n:
PUTCHAR '2'
FINISH

