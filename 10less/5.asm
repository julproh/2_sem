%include "st_io.inc"

global _start
section .text
_start:

mov al, 3
mov bl, 7

and al, bl
shr al,1
jnc m
shr al,1
jnc m

PRINT "same"
jmp t

m: 
PRINT "different"

t:
FINISH
