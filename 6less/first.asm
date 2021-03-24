global _start 
%include "st_io.inc"
section .data
a dd 67682
section .text
_start :

mov eax, [a]
mov ebx, 10
mov edx, 0
mov ecx, 100
mov si, 0

l: div ebx
mov edx, 0 
inc si
add eax, 0
loopne l

mov bx, si
mov eax, 0
mov ax,bx
UNSINT eax
PUTCHAR 10
FINISH
   
