; Author: Jeremy King
; Version: 0.01a
; 11/25/2020

[org 0x7c00] ; tell the assembler that our offset is boot sector code

; the main routine makes sure the parameters are readt and then calls the function
mov bx, HELLO
call print

call print_nl

mov bx, GOODBYE
call print

call print_nl

mov dv, 0x12fe
call print_hex

jmp $

%include "boot-print.asm"
%include "boot-hex.asm"

; data
HELLO:
    db 'Hello, World',0

GOODEBYE:
    db 'Goodbye', 0

; padding
times 510-($-$$) db 0
dw 0xaa55