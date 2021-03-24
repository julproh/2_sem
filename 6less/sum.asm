%include "st_io.inc"

global _start
section .data
mas db 1, -4, 5, -1, 3
section .text
_start:

mov dl, 0
mov ecx, 5
mov ebx, 0

metka1:
cmp [mas+ebx*1], dl
jl  metka2
add al, [mas+ebx*1]
metka2:
inc ebx
loop metka1

cbw
UNSINT eax
PUTCHAR 0xA

FINISH

