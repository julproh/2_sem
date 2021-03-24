global _start
%include "st_io.inc"
section .data
  A dw 254
  B dw 250
section .text
_start:
 mov eax, 0 
 mov al, [A]
 add dword[B], eax
 mov eax, 0
 mov al, [A+1]
 adc dword[B+1], eax
 UNSINT [B]
 PUTCHAR 0xA
FINISH
