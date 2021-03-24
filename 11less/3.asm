%include "st_io.inc"

global _start
section .text
section .bss
section .data
per db 10111110b
a db 11100000b
b db 00011000b
c db 111b
_start:
mov al, [a]
mov bl, [b]
mov cl, [c]
mov dl, [per]

and al, dl
and bl, dl
and cl, dl

shr al,5
shr bl, 3

mov dl, al
mov al, bl
mov bl, dl

cmp al, bl
je l
jmp t

l:
PRINT "SAME"

t:
PRINT "A - "
PUTCHAR al
PUTCHAR 0xA
PRINT "B -"
PUTCHAR bl
PUTCHAR 0xA
PRINT "C - "
PUTCHAR cl
PUTCHAR 0xA

FINISH
