[BITS 16]
[org 0x7c00]

mov bx, hello_string
call print

mov bx, copypasta_string
call print

mov bx, goodbye_string
call print

jmp $

%include "asm/print.asm"

hello_string: db 'Hello friend?', 0xa, 0xd, 0
goodbye_string: db 'Going offline, goodbye :(', 0xa, 0xd, 0

copypasta_string:
db "What the fuck did you just fucking say about me,", 0xa, 0xd
db "you little bitch? Ill have you know I graduated", 0xa, 0xd
db "top of my class in the Navy Seals, and Ive been", 0xa, 0xd
db "involved in numerous secret raids on Al-Quaeda,", 0xa, 0xd
db "and I have over 300 confirmed kills.", 0xa, 0xd, 0x0

times 510-($-$$) db 0
dw 0xaa55