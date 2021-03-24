global _start 
section .data
msg db 'OK'
section .text
_start:
 
jmp l
s : mov eax, 4
    mov ebx, 1
    mov edx, 2
    mov ecx, msg
    int 0x80

mov eax,1 
mov ebx, 0
int 0x80

l: jmp s

mov eax, 1
