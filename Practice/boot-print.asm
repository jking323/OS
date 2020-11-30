print :
    pusha

; remember while (string[i] != 0) {print string[i]; i++}

;compare string end
start:
    mov al, [bx] ; bx is the address string
    cmp al, 0
    je done

    ; this prints with the help of the bios
    mov ah, 0x0e ; tty mode from the bios
    int 0x10 ; video interrupt

    ; increment pointer and loop
    add bx, 1 ; reminder since x86 is little endian the commands are backwards,
    jmp start ;you're adding 1 to pointer bx not the other way around

done:
    popa ; pops a from the stack
    ret  ; returns

print_nl:
    pusha ; pushes a to the stack

    mov ah, 0x0e
    mov al, 0x0a ; 0x0a newline opperator
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10

    popa
    ret
