%include "st_io.inc"

global _start
section .data
section .text
_start:

mov ax, 1101b
mov ecx, 16
mov ebx, 0

m:
shl ax, 1
jnc n
add ebx,1
n:
loop m


UNSINT ebx
PUTCHAR 0xA
FINISH 

