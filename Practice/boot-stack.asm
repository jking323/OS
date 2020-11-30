; Author: Jeremy King
; Version: 0.01a
; 11/25/2020
mov ah, 0x0e ; tty mode

mov bp, 0x8000 ; this address is far from 0x7c00 to prevent writing over this sector
mov sp, bp ; if stack is empty sp points to bp

push 'A' ; push moves data into the stack
push 'B' ; since A is pushed first it is at the bottom of the stack
push 'C'

;this shows how the stack builds downwarns
mov al, [0x7ffe] ; 0x8000 -2
int 0x10 ; video interrupt op code

; you can't access 0x8000 now, you can only access the top of the stack
; so below we move al to address 0x8000 so it can be accessed
mov al, [0x8000]
int 0x10

; pop is used to recover characters from the stack, we can only 'pop' full words
; so we need another register in order to manipulate the lower byte
pop bx
mov al, bl
int 0x10 ; prints C because C was the last push it is the first one pop'd

pop bx
mov al, bl
int 0x10 ; prints B

pop bx
mov al, bl
int 0x10 ; prints A

; now that the stack is empty the data needs to be trashed as it's no longer needed
mov al, [0x8000]
int 0x10

jmp $ ; begins inf loop
times 510-($-$$) db 0 ;pads with 0's
; magic boot number
dq 0xaa55