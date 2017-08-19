[BITS 16]
; Written by Ali Murtaza Sharif
; We'll play around with the stack in this program
mov ah, 0x0e ; Scrolling tty BIOS print routine

mov bp, 0x8000	; Set the base of the stack			
mov sp, bp 		; Start the stack at its new position

push 'A'
push 'B'
push 'C'

pop bx		; Take a value off the stack
mov al, bl	; Place the lower two bytes in al
int 0x10	; Call BIOS routine 10 to print(al)

mov al, [0x7ffc]	; I think this will print "B"
int 0x10

mov al, [0x7ffe]	; This should print "A"
int 0x10

jmp $				; Loop forever

times 510-($-$$) db 0
dw 0xaa55