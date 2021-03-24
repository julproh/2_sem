%include "st_io.inc"
global _start
section .text
_start:
xor ebx,ebx
xor esi,esi
mov ecx,4
l:
mov esi,4
sub esi,ecx
mov edi,ecx
mov ecx,edi
l1:
xor eax,eax
mov al,[a+ebx+esi]
push ebx
push eax
mov ax,bx
mov bl,4
div bl
xor ebx,ebx
mov bl,al
xor edx,edx
mov dl,[a+esi*4+ebx]
pop eax
mov [a+esi*4+ebx],al
pop ebx
mov [a+ebx+esi],dl

inc esi
dec ecx
cmp ecx,0
jne l1

add ebx,4
mov ecx,edi
dec ecx
cmp ecx,0
jne l

xor ebx,ebx
mov ecx,4
m:
xor esi,esi
mov edi,ecx
mov ecx,4
m1:
xor eax,eax
mov al,[a+ebx+esi]
jmp p
pp:
inc esi
loop m1

PUTCHAR 10
add ebx,4
mov ecx,edi
loop m
 

FINISH
p: 
UNSINT eax
PUTCHAR ' '
jmp pp


section .data
a db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16

