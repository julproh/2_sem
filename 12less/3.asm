sectio%include "st_io.inc"
global _start
section .data
s1 dw 10, -11, 12, -13, 14, 15, -16, 17, 18, 19
s2 dw 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
section .text
_start:

mov ecx, 10
mov esi, s1
mov edi, s2
rep movsw

mov ecx, 10
mov ebx, 0
l:
mov ax, word[s2+ebx*2]
cwde
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
