%include "st_io.inc"
global _start
section .data
s db "q19f1234df"
section .text
_start:

mov al, 1
mov bl, a
UNSINT eax
UNSINT ebx



PUTCHAR 0xA
FINISH
