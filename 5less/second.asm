global _start 
section .data 
 msg db 'Ok'
section .text
_start :

jmp short l
s: mov ebx, 1
mov eax,4 
mov edx, 2
mov ecx, msg
int 0x80

mov eax, 1
mov ebx, 0
int 0x80
 
l: jmp short s
