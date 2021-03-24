%include "st_io.inc"
global _start

section .bss
bc resd 1
section .data
masiv dd 4,1,-6,5,-9,3
n dd 6

section .text
_start:
sub esp, 4
push masiv
push dword[n]

call minimum
pop ebx
PRINT "минимум:"
SIGNINT ebx
PUTCHAR 0xA
PUTCHAR 0xA
mov ecx, [n]
mov esi, masiv
PRINT "массив:"
PUTCHAR 0xA
ll:
lodsd
SIGNINT eax
PUTCHAR 0xA

dec ecx
cmp ecx, 0
jne ll

PUTCHAR 0xA
FINISH


minimum:
mov ebp,esp

mov ecx, [ebp+4]
mov edi, [ebp+8]
xor ebx,ebx
mov eax, [edi]
metka2:
	cld
	scasd 
	jl metka 
	mov eax,[edi-4]
	mov edx, eax
	mov esi, edi
	sub ebx, 4
metka:
loop metka2
mov [ebp+8], edx
mov edx, eax
mov edi, ebx
mov eax, 700
stosd 
ret 8
