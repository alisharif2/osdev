; Print function
; Takes one parameter: starting position of string
; Place parameter in register bx before calling

print:
	pusha	; Save all the values of the registers
	mov ah, 0x0e
	
	; The starting address of the null terminated
	; string is located in bx
	
	; Iterated over the adresses starting from bx
	; until we hit zero
	print_loop:
		mov al, [bx]
		cmp al, 0x0
		je print_return
		int 0x10
		add bx, 0x1
		jmp print_loop
	
	print_return:
		popa
		ret