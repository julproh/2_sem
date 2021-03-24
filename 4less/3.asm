global _start
%include "st_io.inc"
section .text
_start:
 mov eax, (5684/4+357/3+245/5)*3
 
 PUTCHAR eax  
 PUTCHAR 0xA
FINISH
