%include "st_io.inc"
global _start
section .data
section .text
_start:

mov ax, 1100000000000101b

shl eax, 16
shr ax, 3
rol eax, 3

UNSINT eax
PUTCHAR 0xA
FINISH


