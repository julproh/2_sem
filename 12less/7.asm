%include "st_io.inc"
global _start
section .data
s1 db "123*567890"
section .text
_start:
mov bl, "+"
mov al , "*"
mov ecx, 10
mov edi, s1
repnz scasb
mov [edi-1], bl 

mov ecx, 10
mov ebx, 0
l:
mov al, [s1+ebx*1]
PUTCHAR al
inc ebx
dec ecx
cmp ecx, 0
je t
jmp l

t:

PUTCHAR 0xA
FINISH
