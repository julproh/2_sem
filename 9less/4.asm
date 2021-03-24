%include "st_io.inc"
global _start
section .data
a dd 45
b dd 55
section .bss
d resb 1
section .text

sum:
mov ebp, esp
mov edx, [ebp+4]
add edx, [ebp+8]
UNSINT edx
PUTCHAR 0xA
ret

razn:
mov ebp, esp
mov edx, [ebp+4]
sub edx, [ebp+8]
UNSINT edx
PUTCHAR 0xA
ret

_start:
mov eax, [a]
mov ebx, [b]
push eax
push ebx
call sum
call razn
FINISH

