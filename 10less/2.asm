%include "st_io.inc"

global _start
section .data
section .text
_start:

mov ax, 6
mov bx, 0
mov ecx, 16

m:
shl ax,1
jc n
cmp ebx,0
jne e
t:
loop m

jmp w

e:
PRINT "0"
jmp t

n:
mov bx,1 
PRINT "1"
jmp t

w:
FINISH
