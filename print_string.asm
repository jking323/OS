; print function
; Author: Jeremy King
; Version: 0.01a
; 11/30/2020

print_string:
    pusha
    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    popa
    ret