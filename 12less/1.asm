%include "st_io.inc"
global _start
section .data
s1 db "123456"
s2 db "abcdef"
section .text
_start:
mov ecx, 6
mov esi, s1
mov edi, s2
rep movsb

mov ecx, 7
mov ebx, 0
l:
mov al, [s2+ebx*1]
PUTCHAR al
inc ebx
dec ecx
cmp ecx, 0
je t
jmp l

t:
PUTCHAR 0xA
FINISH
