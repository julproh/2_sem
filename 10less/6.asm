%include "st_io.inc"

global _start
section .text
_start:

mov ax, 56
mov ebx, 0
mov ecx, 3
m:
shl bx,1
shl ax, 1
jc n
jmp l
n: 
or bx, 1
l:
loop m
shr ax, 3

and ax, bx
mov ecx, 3
z:
shr ax,1
jnc k
loop z

PRINT "same"
jmp t

k:
PRINT "different"

t:
FINISH
