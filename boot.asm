; Boot sector
; Author: Jeremy King
; Version: 0.01a
; 11/30/2020

[org 0x7c00]
    mov bx, HELLO_MSG
    call print_string

    mov bx, GOODBYE_MSG
    call print_string
    jmp $

%include "print_string.asm"

HELLO_MSG:
    db 'Hello, World!', 0x00

GOODBYE_MSG:
    db 'GoodeBye!', 0x00

times 510-($-$$) db 0
dw 0xaa55