global _start
%include "st_io.inc"
section .text
_start :
mov ecx, 100
mov al, 1
mov bh, 1
mov si, 0
l:
inc bh
mul bh
jc s
u:
loopne l

dec bh
mov eax, 0
mov al, bh
UNSINT eax
PUTCHAR 10
FINISH
s: jo p
p: add si, 0
jmp u

