; @author 	: Fakhri Izzudin
; @project 	: Print String

section .data

section .bss

section .text

printStr:

	; Reset pointer ecx dari parameter
	mov ecx, eax

_printStrLoop:
	; cek sampai null
	cmp byte [ecx], 0
	je _printStrExit
	
	; print
	mov eax, 4
	mov edx, 1
	int 0x80

	; Add counter
	add ecx, 1

	jmp _printStrLoop

_printStrExit:

	ret