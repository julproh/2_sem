%include "st_io.inc"

global _start
section .data
section .text
_start:

mov ecx, 4
mov eax, 0
mov dx, 1

m:
jmp n
l:
shr bx, 1
jc a
shl ax, 1
jmp b
a:
shl ax, 1
or ax, dx
b: 
loop m
jmp t

n:
GETUN ebx
jmp l

t:
UNSINT eax
PUTCHAR 0xA
FINISH
