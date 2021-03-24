%include "st_io.inc"
global _start

section .data
m dd 2,2,-6,-5,-8,3
n dd 6

section .text
_start:
push m
push dword[n]

call proc

mov ecx, [n]
mov esi, m
l:
lodsd
SIGNINT eax
PUTCHAR 0xA

dec ecx
cmp ecx, 0
jne l

PUTCHAR 0xA
FINISH


proc:
mov ebp,esp

mov ecx, [ebp+4]
mov edi, [ebp+8]
xor ebx,ebx
mov eax, [edi];min
l2:
	cld
	scasd 
	jl a 
	mov eax,[edi-4]
	mov ebx, edi
	sub ebx, 4
a:
loop l2

mov dword [ebx],700
ret 8
