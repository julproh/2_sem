global _start
%include "st_io.inc"
section .data 
 a db 4
 b db 3
 c db 5
section .text
_start :

mov al, [a]
mov bl, [b]
mov cl, [c]
mov dl, [a]

add dl, bl
cmp dl, cl
je l 
jb l
mov dl, bl
add dl, al
cmp dl, cl
je l
jb l
mov dl, cl
add dl, al
cmp dl, bl
je l
jb l
jmp m
l : PRINT "NO"
FINISH
m : PRINT "YES"
FINISH
