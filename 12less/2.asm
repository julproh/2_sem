%include "st_io.inc"

global _start
section .data
s1 db "1234567890"
s2 db "abcdefgzxc"
section .text
_start:
mov ecx, 4
mov ebx, 1
mov esi, s1+2
mov edi, s2+4
rep movsb

mov ecx, 11
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
