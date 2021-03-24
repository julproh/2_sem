%include "st_io.inc"
global _start
section .data
a db 11111110b
section .text
_start:

mov al, 11100000b
mov bl, 11000b
mov cl, 111b

and al, [a]
shr al, 5
and bl, [a]
shr bl, 3
and cl, [a]

PRINT "A - "
UNSINT eax
PUTCHAR 0xA
PRINT "B - "
UNSINT ebx
PUTCHAR 0xA
PRINT "C -"
UNSINT ecx
PUTCHAR 0xA

xchg al, cl

shl byte[a], 3
shr byte[a], 6
shl byte[a], 3

shl al, 5

or [a], al
or [a], cl

PRINT "Поменяли А и С"
PUTCHAR 0xA
mov al, 11100000b
mov bl, 11000b
mov cl, 111b

and al, [a]
shr al, 5
and bl, [a]
shr bl, 3
and cl, [a]

PRINT "A - "
UNSINT eax
PUTCHAR 0xA
PRINT "B - "
UNSINT ebx
PUTCHAR 0xA
PRINT "C -"
UNSINT ecx
PUTCHAR 0xA

cmp eax, ebx
je l
PRINT "Отличаются"
jmp en
l:
PRINT "Равны"
en:
PUTCHAR 0xA
FINISH
