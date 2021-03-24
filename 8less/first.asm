%include "st_io.inc"
global _start
section .dat
mas dd 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21
section .bss

section .text
_start:
mov ecx,11
mov eax, 0
l:
	PUSH dword [mas+eax*4]
	inc eax
loop l

	mov ebp,esp
	mov edx, [ebp]
	mov eax, [ebp+4]
	mov [ebp+4], edx
	mov [ebp], eax
mov ecx,11
mov eax,0

l1:
	POP eax
	UNSINT eax
	PRINT " "
	dec ecx
cmp ecx, 0
jne l1

PUTCHAR 0xa
FINISH
