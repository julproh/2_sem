%include "st_io.inc"
global _start
section .data
n db 7
a db 1
b db 0
section .text

fib:
l:
mov bl,2
mov ax,cx
div bl
cmp ah, 0
ja metka1
jmp metka2
emet1:
emet2:
loop l
 jmp finish
metka1:
xor eax, eax
mov al, [a]
UNSINT eax
PUTCHAR 0xA
mov bl, [b] 
add bl, al
mov [b], bl 
jmp emet1

metka2:
xor eax, eax
mov al,[ b]
UNSINT eax 
PUTCHAR 0xa
mov bl, [a]
add bl, al
mov [a], bl
jmp emet2
 finish:
ret

_start:
	mov ecx,7
	call fib
	PUTCHAR 0xA
FINISH











