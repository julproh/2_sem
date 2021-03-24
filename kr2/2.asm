%include "st_io.inc"
global _start
section .data
section .text
_start:
mov ax, 11011001b
mov bx, 11101010b

mov cx, 111b
and cx, ax

shr ax, 12
shl ax, 12

mov dx, bx
and dx, 111000000000000b
shr dx, 12

or ax, dx

shl cx, 12
shl bx, 3
shr bx, 3

or bx, cx

UNSINT eax
PUTCHAR 0xa
UNSINT ebx
PUTCHAR 0xA
FINISH
