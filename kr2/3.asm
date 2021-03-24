%include "st_io.inc"

global _start
section .data

section .text
_start:

; меням sf

mov al, 0
sub al, 5
pushf
pop ebx
xor ebx, 1000000b
push ebx
popf

js metka
PRINT "ZERO"
PUTCHAR 0xa
jmp t
metka: 
PRINT "ONE"
PUTCHAR 0xa
t:
; меняем zf

mov al, 0
add al, 1
pushf
pop ebx
xor ebx, 100000b
push ebx
popf

jz metka1
PRINT "ZERO"
PUTCHAR 0xa
jmp en
metka1:
PRINT "ONE"
PUTCHAR 0xa
en:
FINISH
