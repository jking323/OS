;now prints text to screen
mov ah, 0x0e ; sets tty mode
mov al, 'H'
int 0x10 ; video inturrupt instruction
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; prints l twice saving memory
mov al, 'o'
int 0x10

jmp $ ; jump to current address creating an infinite loop
; fills file with 510 zeros minus the size of the jmp loop
times 510-($-$$) db 0
;magic number
dw 0xaa55