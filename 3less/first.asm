global _start
section .data
msg db "Hello world", 10, 0
msgln equ $-msg
section .text
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, msgln
int 0x80
	mov eax, 1
	mov ebx, 0
int 0x80 
