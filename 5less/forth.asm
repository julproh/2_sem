global _start
%include "st_io.inc"
section .data
a dw 534
section .text
_start :
 mov ax, [a]
 mov bl, 10
 jmp s

s : div bl
    cmp ah, 5
    je l
    mov ah, 0
    cmp al, 0
    je k
    jmp s
k : PRINT "NO"
    jmp z  
l : PRINT "YES"
z : FINISH


