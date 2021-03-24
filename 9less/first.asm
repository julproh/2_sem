%include "st_io.inc"
global _start

section .bss
adr resd 1
section .text
_start:

mov eax, m
mov dword[adr], eax
jmp pp
m:

mov eax,m1
mov dword[adr], eax
jmp pp
m1:


FINISH

pp:

jmp dword[adr]
