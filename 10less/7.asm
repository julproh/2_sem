%include "st_io.inc"

global _start
section .text
_start:

mov ecx, 4
mov al, 7
mov bl, 7
mov dl,0
m:
shl dl,1
shl al,1
jc q
jmp w
q:
or dl, 1
w:
loop m
mov ecx,4
shl bl, 4
n :
shl dl,1
shl bl,1
jc e
jmp r
e:
or dl,1
r:
loop n

UNSINT edx
FINISH
