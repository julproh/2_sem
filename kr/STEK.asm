%include "st_io.inc"
global _start
section .data
mas dw 1,2, 3, 4, 5

section .text
_start:
mov ecx,5
mov eax, 0
l:
	PUSH word[mas+eax*2]
	inc eax
loop l

	mov ebp,esp
	mov dx, [ebp+2]
	mov ax, [ebp+6]
	mov [ebp+6], dx
	mov [ebp+2], ax
mov ecx,5
mov eax,4

l1:
	POP word[mas+eax*2]
	dec eax
loop l1

mov ecx, 5
mov eax, 0

l2:
	mov ebx, 0
	mov bx, word[mas+eax*2]
	UNSINT ebx
	inc eax
	PRINT " "
	dec ecx
cmp ecx, 0
jne l2

PUTCHAR 0xa
FINISH
