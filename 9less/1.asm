
%include "st_io.inc"

global _start
section .data
section .bss
adr resd 1

section .text
_start:

mov eax, 45
mov ebx, 67
mov ecx, n
mov [adr],ecx
jmp sum

n:
mov eax, 56
mov ebx, 33
mov ecx, m
mov [adr], ecx
jmp sum

m:
FINISH

sum:
add eax,ebx
UNSINT eax
PUTCHAR 0xA
jmp dword[adr]
