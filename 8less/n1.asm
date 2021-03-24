%include "st_io.inc"
global _start

section .data
a dd 1,2,3,4,5,6,7,8,9,10

section .bss
b resb 4
c resb 4

section .text
_start:
mov ecx,10
mov eax,0
l:
	PUSH dword[a+eax*4]
	inc eax
	loop l

mov ebp, esp

mov edx, [ebp]
mov eax, [ebp+4]
mov [ebp+4], edx
mov [ebp], eax

mov ecx, 10
mov eax, 0

l1:
	POP eax
	UNSINT eax
	PUTCHAR " "
	dec ecx
	cmp ecx,0
	jne l1

FINISH
