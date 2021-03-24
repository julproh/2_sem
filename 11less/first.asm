%include "st_io.inc"

global _start
section .data

section .text
_start:

mov al, 0
sub al, 5
pushf
pop ebx
xor ebx, 1000000b
push ebx
popf

js metka
PRINT "ZERO"
jmp t
metka: 
PRINT "ONE"
t:
FINISH
