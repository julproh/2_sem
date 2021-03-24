%include "st_io.inc"
global _start
section .data
a dd 45
b dd 55
section .bss
d resb 1
section .text

sum:
mov eax, [a]
add eax, [b]
mov [d], eax
ret
_start:
call sum
UNSINT dword[d]
PUTCHAR 0xA
call razn
UNSINT dword [d]
PUTCHAR 0xA
FINISH


razn:
mov eax, [b]
sub eax, [a]
mov [d], eax
ret



