%include "blitz_stdio.asm"
%define O_RDONLY 0
%define PROT_READ 0x1
%define MAP_PRIVATE 0x2
%define SIZE 4095

; rdi is the file name
open_read:
    push rsi
    push rdx
    mov rax, 2
    mov rsi, O_RDONLY
    mov rdx, 0
    syscall
    pop rdx
    pop rsi
    ret


; takes in rax as the file descriptor
mmap:
    push r8
    push rsi
    push rdx
    push r10
    push r9
    mov r8, rax ; The fd
    mov rax, 9
    mov rdi, 0 ; Starting address
    mov rsi, rcx ; how much to read
    mov rdx, PROT_READ ; protection flags
    mov r10, MAP_PRIVATE ; what type of page
    mov r9, 0 ; offset in the file
    syscall
    mov rdi, rax
    pop r9
    pop r10
    pop rdx
    pop rsi
    pop r8
    ret

