%include "st_io.inc"
global _start
section .dat
mas dd 11, 12, 0, 14, 0, 16, 17, 18, 0, 20, 21
section .bss

section .text
_start:

mov ecx,10
mov eax, 0
l:
	PUSH dword [mas+eax*4]
	inc eax
loop l

mov ebx, 0
mov ecx, 11
mov eax, 0

	mov ebp,esp
l2:
	mov edx, [ebp+ebx*4]
	cmp edx, 0
	je l1
l3:
	inc ebx
	dec ecx
	cmp ecx, 0
	je l4

l1:
	inc al
jmp l3

l4:
UNSINT eax
PUTCHAR 0xa
FINISH
