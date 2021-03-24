global _start
section .bss
p resb 1
section .data
msg db 'okey', 0xa
section .text
_start :
mov eax, s
jmp eax

l: mov edx,5
mov ecx, msg
mov ebx, 1
mov eax, 4
int 0x80

mov eax, 1
mov ebx, 0
int 0x80

s: mov eax, l
   mov [p], eax
   jmp dword[p]

