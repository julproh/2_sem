%include "st_io.inc"
global _start
section .data
 mas db 9,2,3,4,5,6,7,8,9

section .text
_start:

mov eax, 0
mov ebx, 0
mov ecx, 3
mov dl,[mas]
l:
mov esi, ecx
mov ecx, 3

l1: 
cmp dl, [mas+eax+ebx*1]
jb met

mov dl, 0
mov dl, [mas+eax+ebx*1]
mov ebp, ebx

met:
inc ebx
loop l1

mov ebx, 0
add eax, 3
mov ecx, esi
loop l

mov eax, 0
mov al, dl
UNSINT eax
PUTCHAR 0xa
mov ebx,0
mov ebx,ebp
UNSINT ebx
PUTCHAR 0xA
FINISH

