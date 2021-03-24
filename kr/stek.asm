%include "st_io.inc"
global _start
section .data
mas dw 1,2, 3, 4, 5

section .text
_start:
mov ecx,5
mov eax, 0
l:
	PUSH word[mas+eax*2-2]
	inc eax
loop l

	mov ebp,esp
	mov edx, [ebp+2]
	mov eax, [ebp+6]
	mov [ebp+6], edx
	mov [ebp+2], eax
mov ecx,5
mov eax,5

l1:
	POP word[mas+eax*2-2]
	dec eax
loop l1

mov ecx, 5
mov eax, 0

l2:
	mov ebx, 0
	mov ebx, dword[mas+eax*2-2]
	UNSINT ebx
	inc eax
	PRINT " "
	dec ecx
cmp ecx, 0
jne l2

PUTCHAR 0xa
FINISH
