%include "st_io.inc"
global _start
f dd 1
s dd 1
section .bss
n resd 1
fb resd 1
section .text
_start:
GETUN dword [n]
mov ecx,[n]
call ff
UNSINT eax
PUTCHAR 0xa
FINISH

ff:
cmp ecx,1
jne m
mov eax,1
ret
m:
cmp ecx,2
jne m1
mov eax,1
mov ebx,2
ret
m1:
dec ecx
call ff
add eax,ebx
xchg eax,ebx
ret


 



