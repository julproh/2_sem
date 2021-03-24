%include "st_io.inc"

global _start
section .data
 a db 5
 b db 9
 c db 1
section .text
_start:

mov dl, [a]
mov bl, 3

m:
mov al, dl
div bl
xchg ah,al

cbw
cwde
UNSINT eax
PUTCHAR 0xA

add dl, [c]
cmp dl, [b]
ja t
jmp m

t:
FINISH
