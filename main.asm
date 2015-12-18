; Fakhri Izzudin (G64130030)

; Fungsi untuk scan angka
; Result: eax (int)
%include "scanNum.asm"

; Fungsi untuk cetak angka
; Argument: eax (int)
%include "printNum.asm"

; Fungsi untuk print character ke stdout atau stderr
; Argument: al (char), ebx (stdout 1 atau stderr 2)
%include "printChar.asm"


; Fungsi untuk membaca kata
; Result: eax (alamat character pertama), ebx (int atau panjang kata)
%include "scanStr.asm"

; Fungsi untuk print string ke stdout atau stderr, kata harus diakhiri dengan null
; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
%include "printStr.asm"

; Fungsi untuk membandingkan 2 kata, kata harus diakhiri dengan null
; Argument: eax (alamat char pertama kata ke 2), ebx (alamat char pertama kata ke 2)
; Result: eax (1: sama, 0: beda)
%include "cmpStr.asm"

; Fungsi untuk copy dari kata1 (dari eax) ke kata2 (dari ebx) --> ebx = eax, harus diakhiri null
; Argument: eax (alamat character pertama yang akan dicopy), ebx (alamat character pertama hasil)
%include "cpyStr.asm"



section .data
	pesan1 db "panjang: ", 0
	pesan2 db "lebar: ", 0
	pesan3 db "keliling :", 0

	pesan4 db "kata 1 :", 0
	pesan5 db "kata 2 :", 0

section .bss
	panjang resd 1
	lebar resd 1

	kata1 resb 255
	kata2 resb 255


section .text
	global main

main:

	; Cetak pesan1
	mov eax, pesan1
	mov ebx, 1 ;stdout
	call printStr 

	; Scan panjang
	call scanNum
	mov dword [panjang], eax



	; Cetak pesan2
	mov eax, pesan2
	mov ebx, 1 ;stdout
	call printStr

	; Scan lebar
	call scanNum
	mov dword [lebar], eax


	
	; Cetak pesan3
	mov eax, pesan3
	mov ebx, 1 ;stdout
	call printStr

	; Hitung keliling
	mov eax, [panjang]
	mov ebx, [lebar]
	add eax, ebx
	add eax, eax

	; Cetak keliling
	mov ebx, 1 ;stdout
	call printNum

	; Cetak Newline (ascii = 10)
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar






	; Cetak newline
	mov al, 10
	mov ebx, 1
	call printChar





	; Cetak pesan4
	mov eax, pesan4
	mov ebx, 1
	call printStr

	; Baca kata1
	call scanStr

	; Copy string ke kata1
	mov ebx, kata1
	call cpyStr


	; Cetak pesan5
	mov eax, pesan5
	mov ebx, 1
	call printStr

	; Baca kata2
	call scanStr

	; Copy string ke kata2
	mov ebx, kata2
	call cpyStr


	; Cetak kata1
	mov eax, kata1
	mov ebx, 1
	call printStr

	; Cetak spasi
	mov al, ' '
	mov ebx, 1
	call printChar

	; Bandingkan kata1 dan kata2
	mov eax, kata1
	mov ebx, kata2
	call cmpStr

	; Jump jika beda
	cmp eax, 1
	jne beda

	; Cetak '='
	mov al, '='
	mov ebx, 1
	call printChar

next:
	; Cetak spasi
	mov al, ' '
	mov ebx, 1
	call printChar


	; Cetak kata2
	mov eax, kata2
	mov ebx, 1
	call printStr


	; Cetak newline
	mov al, 10
	mov ebx, 1
	call printChar


	jmp exit

beda:
	; Cetak "<>"

	mov al, '<'
	mov ebx, 1
	call printChar

	mov al, '>'
	mov ebx, 1
	call printChar

	jmp next


exit:
	mov eax, 1
	mov ebx, 0
	int 0x80