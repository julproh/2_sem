%include "st_io.inc"
global _start
section .dat
a db 1,1,1,1,1,1,1,1,1

section .bss
sum resb 1

section .text
_start:
mov eax,0         ; line
mov ebx,0         ;  col
mov ecx,3         ; count
l:
mov esi,ecx
mov ecx,3
l1:
mov dl,[a+eax+ebx*1]
add [sum],dl
inc ebx
loop l1
mov ebx,0
add eax,3
mov ecx,esi
loop l
mov eax,0
mov al,[sum]
UNSINT eax
PUTCHAR 0xa
FINISH

