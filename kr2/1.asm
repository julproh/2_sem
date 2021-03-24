%include "st_io.inc"
global _start
section .data
masiv dd 5, -7, 4, 6, -3, 1
n dd 6
section .text
_start:

push masiv
push dword[n]

call min
mov eax, masiv
mov ecx, dword[n]
mov ebx, 0
o: cmp ecx, 0
ja t
jmp end
t:
SIGNINT [eax+ebx*4]
inc ebx
dec ecx
jmp o
end:
PUTCHAR 0xA
FINISH

min:
pop ecx
pop ebp

mov ebx, dword[ebp]
mov eax, 0

metka:
cmp dword[ebp+eax*4], ebx
jb k

mm:
inc eax
loop metka
mov dword[ebp+edx*4], 700
jmp e

k: 
mov ebx, dword[ebp+eax*4]
mov edx, eax
jmp mm
e:

ret
