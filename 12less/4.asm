%include "st_io.inc"
global _start
section .data
s1 dd 11, 12, -13, 14, 15, -16, 17, -18, 19, 20
s2 dd 30, 31, 32, 33, 34, 35, 36, 37, 38, 39
section .text
_start:

mov ecx, 3
mov esi, s1+8
mov edi, s2+4
rep  movsd

mov ecx, 10
mov ebx, 0
l:
mov eax, dword[s2+ebx*4]
SIGNINT eax
PRINT ","
inc ebx
dec ecx
cmp ecx, 0
je t
jmp l

t:

PUTCHAR 0xA
FINISH
