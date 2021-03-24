%include "st_io.inc"
global _start

; собираем кучу
init_heap:
xor ebx, ebx
mov eax, 45
int 0x80

add eax,6*k
mov ebx, eax
mov eax, 45
int 0x80

sub eax,6
mov ecx, heap_size
mov ebx, NULL
l: mov[eax+node.next], ebx
mov ebx, eax
sub eax,  6
loop l
mov [heap_ptr], ebx 
ret

; добавляем элемент в начало цикла
new:
mov edi, [heap_ptr]
cmp edi, NULL
je empty
push dword[edi+node.next]
pop dword[heap_ptr]
ret

empty:
mov edi, 0
PRINT "empty"
PUTCHAR 0xA
ret

; вывод списка
print:
mov ebx, [list]
m3:
cmp ebx, NULL
je m4
xor eax,eax
mov ax, [ebx+node.elem]
UNSINT eax
PUTCHAR 0xA
mov ebx,[ebx+node.next]
jmp m3
m4:
ret

; сравнение 
comp:
pushad
mov edi, [list]
lll:
mov ax, word[edi+node.elem]
mov bx, 1110000000000000b
mov cx, 111b
and bx, ax
and dx, ax
shr bx, 13
cmp dx, bx
jne t
;call delete
t:
mov ebx, edi
mov edi, [edi+node.next] 
end: 
cmp dword[edi+node.next], NULL
jne lll
popad
ret

;удаление первого элемента
del1:
pushad
mov edi, [list]
push dword[edi+node.next]
pop dword[list]
call free
popad
call print
ret

;удавление последнего
dell:
pushad
mov ebx, [list]
mov edx, NULL
met1:
cmp dword[ebx+node.next], NULL
jne met2
mov dword[edx+node.next], NULL
mov edi, ebx
call free
jmp pri
met2:
mov edx, ebx
mov ebx, [ebx+node.next]
jmp met1
pri:
popad
call print
ret

;освобождаем
free:
push dword[heap_ptr]
mov [heap_ptr], edi
pop dword[edi+node.next]
ret

delete:
cmp edi, [list]
jne p
;call del1
p:
cmp dword[edi+node.next], NULL
jne u
;call dell
u:
mov ecx, [edi+node.next]
mov [ebx+node.next], ecx
;call print
PUTCHAR 0xA
ret




new_find_and_del:
mov edi,[list]
mov edx, NULL
u1:
cmp edi,NULL
je u3
mov ax,[edi+node.elem]
mov cx, 1110000000000000b
and cx,ax
mov bx, 111b
and bx,ax
shr cx,13
xor cx,bx
cmp cx,0 
jne u2
cmp edx, NULL
jne u5

u5:
mov esi, [edi+node.next]
mov [edx+node.next],esi
u2:
mov edx,edi
mov edi,[edi+node.next]
jmp u1
u3:
call print
ret


section .data

struc node
.elem: resw 1
.next: resd 1
endstruc

section .bss
heap_ptr resd 1
a resd 2
b resb 1
section .data
NULL equ 0
k equ 15
heap_size equ k
list dd NULL

section .text

_start:

call init_heap
mov ecx, 10
mov ebx,[list]
c1:
GETUN eax
cmp ebx,NULL
jne c2
call new
mov [list],edi
mov [edi+node.elem],ax
dec ecx
mov ebx,edi
jmp c1
c2:
call new
mov [ebx+node.next],edi
mov [edi+node.elem],eax
mov ebx,edi
dec ecx
cmp ecx,0
jne c1
mov dword [ebx+node.next],NULL


PUTCHAR 10
call new_find_and_del




finish:
PUTCHAR 0xA
FINISH
