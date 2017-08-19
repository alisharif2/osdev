[BITS 16]
[org 0x7c00]

; Program to demonstrate addressing
mov ah, 0x0e ; Print to screen

; First attempt to print to the screen
mov al, char
int 0x10

; Second attempt
mov al, [char]
int 0x10

; Third attempt
mov bx, char
add bx, 0x7c00
mov al, [bx]
int 0x10

; Fourth Attempt
mov al, [0x7c1d]
int 0x10

jmp $ ; Translates to 0xeb 0xfe

char:
	db "X" ; "X" = 0x58
	
; Padding the magic boot sector number
times 510-($-$$) db 0
dw 0xaa55