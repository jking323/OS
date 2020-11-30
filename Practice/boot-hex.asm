; receive data in dx from boot-string.asm
print_hex:
    pusha

    mov cx, 0 ; out indeax var

; this hex loop grabs the last char from the dx pointer then converts it to ascii
; Numeric ascii values: '0' (ascii 0x30) to '9' (0x39), add 0x30 to byte N
; For alpha char A-F: 'A' (ascii 0x41) to 'F' (0x46) add 0x40
; Move the ascii byte to the correct position in new string
hex_loop:
    cmp cx, 4 ; loop this 4 times
    je end ; je = jump if equal in this case if the loop has run 4 times jump to the end

    ; 1, this section converts last char of dx pointer to ascii
    mov ax, dx ; ax is being used as the working register so we move data from dx into ax here
    and ax, 0x000f ; 0x1234 -> 0x0004
    add al, 0x30 ; add 0x30 to previous value converting it to ascii
    cmp al, 0x39 ; determines if 0-9 or A-F
    jle step2
    add al, 7 ; 'A' is ascii 65 not 58

step2:
    ;2. get the correct position of the string to place our ascii char
    ; bx <- base address + string length - index of xhar
    mov bx, HEX_OUT + 5 ; base + length
    sub bx, cx ; our index var
    mov [bx], al ; copy the ascii char from al into the position pointed ad bx
    ror dx, 4 ; 0x1234 -> 0x4123 -> 0x3412 -> 0x2341 -> 0x1234

    ; increment index and loop through
    add cx, 1
    jmp hex_loop

end:
    ; prepare parameter and call function
    ; remember thet print receives from bx
    mov bx, HEX_OUT
    call print

    popa
    ret

HEX_OUT:
    db '0x0000', 0 ; reserves a spot in memory for out new string