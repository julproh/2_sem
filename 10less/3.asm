%include "st_io.inc"

global _start
section .data
section .text
_start:

mov ax, 45

rol ax, 8

UNSINT eax
PUTCHAR 0xA

FINISH
