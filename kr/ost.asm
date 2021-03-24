global _start
%include "st_io.inc"
section .data
mas db 1, 2, 5
mass db 6, 5, 4
section .text
_start:

mov ecx, 3
l: 
mov al, [mas+esi]
mov bl, [mass+esi]
inc esi

div bl
add dl, ah

loop l

dec dl

mov  eax, 0
mov al, dl

UNSINT eax
PUTCHAR 0xA
FINISH


