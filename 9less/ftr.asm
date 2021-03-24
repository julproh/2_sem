%include "st_io.inc"
global _start
section .data
n dd 4
section .bss

section .text
_start:
mov ecx, [n]
mov ebx,1
call fct
UNSINT eax
PUTCHAR 0xA
FINISH

fct:
cmp ecx, 0
jne m
mov eax, 1
ret
m:
dec ecx
call fct
mul ebx
inc ebx
ret
