%include "st_io.inc"
global _start
section .data
s1 db "1234567890"
s2 db "a3qqw54321"
section .text
_start:
mov ecx, 4
mov esi, s1+2
mov edi, s2+1
repz cmpsb

mov al, [esi-1]
PUTCHAR al
PUTCHAR 0xA
FINISH
