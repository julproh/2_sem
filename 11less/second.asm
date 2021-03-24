%include "st_io.inc"

global _start
section .text
section .bss
t1 resw 1
t2 resw 1
section .data
d1 db 5
m1 db 8
y1 db 80
_start:

;запаковка t1
mov ebx, 0
mov bx, word[d1]
shl bx, 11
mov word[t1], 0
or word[t1], bx

mov ebx,0
mov bx, word[m1]
shl bx, 7
or word[t1], bx

mov ebx, 0
mov bx, word[y1]
mov word[t1], bx
; проверка того, что записалось в t1
mov ebx, 0
mov bx, word[t1]
UNSINT ebx
PUTCHAR 0xA

;второе слово
mov ebx, 0000110010100011b

; вывод t2 в формате t1

mov eax, ebx
shl eax, 11
shr eax, 11
UNSINT eax
PRINT ":"

mov eax, ebx
shl eax, 7
shr eax, 12
UNSINT eax
PRINT ":"

mov eax, ebx
shr eax, 9
UNSINT eax
PUTCHAR 0xA

; вывод t1 в формате t2
mov ebx, 0
mov bx, word[t1]
mov eax, ebx
and eax, 1111111b
UNSINT eax
PRINT ":"

mov eax, ebx
and eax, 11110000000b
shr eax, 7
UNSINT eax
PRINT ":"

mov eax, ebx
and eax, 1111100000000000b
shr eax, 11
UNSINT eax
PUTCHAR 0xA

FINISH
