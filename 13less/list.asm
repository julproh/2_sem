%include "st_io.inc"
global _start

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
k equ 10
heap_size equ k
list dd NULL

section .text

_start:

call init_heap
mov ecx, 5
; присваиваем значения ячейкам списка
m1:
jmp t
m2:
call new
mov [edi+node.elem], ax
push dword[list]
mov [list], edi
pop dword[edi+node.next]
loop m1

call print
PUTCHAR 0xA
PRINT "Удаляем 1 элемент"
PUTCHAR 0xA
call del1
PUTCHAR 0xA
PRINT "Удаляем последний элемент"
PUTCHAR 0xA
call dell
PUTCHAR 0xA
call delete
PUTCHAR 0xA
call vstavitposle
PUTCHAR 0xA
call vstavitdo
PUTCHAR 0xA
call vstavitperv
PUTCHAR 0xA
call vstavitlast
PUTCHAR 0xA
call sort
PUTCHAR 0xA
call deletelist
jmp finish
t:
GETUN eax
jmp m2

finish:
PUTCHAR 0xA
FINISH

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

;освобождаем
free:
push dword[heap_ptr]
mov [heap_ptr], edi
pop dword[edi+node.next]
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

;удаление звена с введенным значением
delete:
PRINT "Введите значение звена, которое надо удалить"
PUTCHAR 0xA
GETUN eax
mov ebx, [list]
mov edx, NULL
metka1:
cmp ebx, NULL
je pr
cmp [ebx+node.elem], ax
jne metka2
cmp edx, NULL
jne metka3
call del1
jmp pr
metka3:
cmp dword[ebx+node.next], NULL
jne metka4
call dell
jmp pr
metka4:
push dword[ebx+node.next]
pop dword[edx+node.next]
mov edi, ebx
call free
jmp pr
metka2:
mov edx, ebx
mov ebx, [ebx+node.next]
jmp metka1
pr:
call print
PUTCHAR 0xA
ret

;вставить после
vstavitposle:
PRINT "Введите значение звена, после которого нужно вставить элемент"
PUTCHAR 0xA
GETUN eax
PUTCHAR 0xA
call find
PRINT "введите значние элемента"
PUTCHAR 0xA
GETUN eax
mov ebx,[a]
push dword[ebx+node.next]
call new
mov [edi+node.elem],ax
mov [ebx+node.next], edi
pop dword[edi+node.next]
call print
ret

;вставить перое значение
vstavitperv:
PRINT "Введите значение элемента  (для вставки вначало)"
PUTCHAR 0xA
GETUN eax
PUTCHAR 0xA
call new
push dword[list]
mov [list], edi
pop dword[edi+node.next]
mov [edi+node.elem], ax
call print
PUTCHAR 0xA
ret

; вставить последнее значение
vstavitlast:
PRINT "Введите значение элемента (для вставки в конец)"
PUTCHAR 0xA
GETUN eax
PUTCHAR 0xA
mov ebx, [list]
q1:
cmp dword[ebx+node.next], NULL
jne q2
call new
mov [ebx+node.next], edi
mov [edi+node.elem], ax
mov dword[edi+node.next], NULL
call print
ret
q2:
mov ebx, [ebx+node.next]
jmp  q1
ret
; вставить до
vstavitdo:
PRINT "Введите значение звена, до которого нужно вставить новое"
PUTCHAR 0xA
GETUN eax
PUTCHAR 0xa
call find
PRINT "Введите значение"
PUTCHAR 0xA
GETUN eax
PUTCHAR 0xA
call new
cmp dword[a+4], NULL
jne str1
push dword[list]
mov [list], edi
pop dword[edi+node.next]
mov [edi+node.elem], ax
jmp str2
str1:
mov [edi+node.elem], ax
mov ebx, [a+4]
mov [ebx+node.next], edi
mov ebx, [a]
mov [edi+node.next], ebx
str2:
call print
ret

find:
pushad 
mov ebx, [list]
mov edx, NULL
find1:
cmp ebx, NULL
jne find2
jmp end
find2:
cmp word[ebx+node.elem],ax
jne find3
mov [a], ebx
mov [a+4], edx
jmp end
find3:
mov edx, ebx
mov ebx, [ebx+node.next]
jmp find1
end:
popad
ret

deletelist:
mov ebx, [list]
list1:
cmp ebx, NULL
jne list2
PRINT "Список был удален"
PUTCHAR 0xa
ret
list2:
mov edi, ebx
mov ebx, [ebx+node.next]
call free
jmp list1

sort:
pushad
mov byte[b], 0
mov ebx, [list]
sort1:
cmp ebx, NULL
jne sort2
popad
mov cl, [b]
add [b], cl
xor ecx, ecx
mov cl, [b]
sort3:
mov ebx, [list]
sort4:
cmp dword[ebx+node.next], NULL
jne sort5
dec ecx
cmp ecx, 0
je prr
jmp sort3
sort5:
mov dx, [ebx+node.elem]
mov esi, [ebx+node.next]
cmp dx, [esi+node.elem]
jb sort6
mov eax, ebx
call change
sort6:
mov ebx, esi
jmp sort4
prr:
call print
ret
sort2:
inc byte[b]
mov ebx, [ebx+node.next]
jmp sort1

change:
pushad
push word[eax+node.elem]
mov ebx, [eax+node.next]
mov dx, [ebx+node.elem]
pop word[ebx+node.elem]
mov [eax+node.elem], dx
popad
ret
