%include "st_io.inc"
global _start
section .data
 mas db 1,2,3,4,5,6,7,8,9
 mes db 9,8,7,6,5,4,3,2,1
section .bss
sum resb 9

section .text
_start:

mov ebp, 0
mov ebx, 0
mov ecx, 3

l:
mov esi, ecx
mov ecx, 3

l1:
mov dl, [mas + ebp + ebx*1]

mov ax, [mes+ebp+ ebx*1]
mul dl
add dl, [mes+eax+ebx*1]
mov [ebp], dl
inc ebp
inc ebx
loop l1

mov ebx, 0
add eax, 3
mov ecx, esi
loop l

mov ecx,9
mov eax, 0
mov ebx, 0
 l2:
 mov al,[sum +ebx+ebx*0]
 inc ebx
 UNSINT eax
 mov eax, 0
 PRINT " "
 dec ecx
 jmp t

 p:
PUTCHAR 0xa
FINISH

 t:
 cmp ecx, 0
 je p
 jmp l2
