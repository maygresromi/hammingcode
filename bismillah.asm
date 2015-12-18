; Template By : Fakhri Izzudin (G64130030) & Ivan Maulana 
; Program Membuat Konversi Biner, Hamming Code dll

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

; Fungsi untuk scan angka
; Result: eax (int)
%include "scanNum.asm"

; Fungsi untuk cetak angka
; Argument: eax (int)
%include "printNum.asm"

; Fungsi untuk print character ke stdout atau stderr
; Argument: al (char), ebx (stdout 1 atau stderr 2)
%include "printChar.asm"

; Fungsi untuk print string ke stdout atau stderr, kata harus diakhiri dengan null
; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
%include "printStr.asm"

; Fungsi untuk konversi biner
; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
%include "konversibiner.asm"

; Fungsi untuk iterasi aaray bagi 2
; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
%include "iterasi.asm"

; Fungsi untuk cetakbiner
; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
%include "cetakbiner.asm"

; Fungsi untuk header
; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
%include "header.asm"

; Fungsi untuk menupilih
; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
%include "menupilih.asm"

; Fungsi untuk hamming
; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
%include "hamming.asm"

; Fungsi untuk hamming
; Argument: eax (alamat char pertama), ebx (stdout 1 atau stderr 2)
%include "kuisioner.asm"
%include "loopjum.asm"
%include "iterasi2.asm"

; fungsi untuk clear screen
%include    'function/clrScr.asm'

; menggunakan fungsi dari bahasa C
extern printf
extern scanf


section .data
	msg1	db "*****************************************************************************************************************",10,0
	msg2	db "|				     SELAMAT DATANG DI PROGRAM ASSEMBLY                                         |",10,0
	msg3	db "|                           ------------------------------------------------------                              |",10,0
	msg4	db "|                           MAYGRES ROMI G64154060 - JAYANTIKA FITRITANA G64154023                              |",10,0
	msg5	db "*****************************************************************************************************************",10,0
	
	msg6	db "1 Program Konversi Desimal - Biner",10,0
	msg7	db "2 Program Hamming Code",10,0
	msg8	db "Pilih Program  	: ",0
	
	pesan 	db "--- Program untuk Menghitung Konversi Bilangan Desimal ke dalam Bentuk Biner ---",10, 0
	pesan1 	db "Bilangan Desimal: ", 0
	pesan2 	db "Bilangan Biner	: ", 0
	pesancb	db "Check Bit	: ",0
	
	pesan3	db "--- Program untuk Mendeteksi Bit Error Hamming Code ---",10,0
	pesan4	db "Jumlah Data	: ",0
	pesan5	db "Bit Error	: ",0
	pesan6	db "Maaf Program Dihentikan, Jumlah data lebih kecil dari Bit Error",10,0
	
	bagi 		dd 2
	jumcek		dd 0
	hasil		dd 0
	jum 		dd 1
	i 			dd 0
	x			dd 0
	j			dd 0
	jTemp		dd 0
	
	erorpilih 	db "Maaf Pilihan yang Anda Masukkan Tidak Terdaftar!",10,0
	pesandone 	db "Selesai !!",10,0
	pesanNilai 	db "Berikan satu kata untuk program ini : ",0
	pesanNilai2	db "-- Berikan nilai untuk program ini --",10,0
	pesanNilai3	db "Terima Kasih, Penilaian anda terhadap program ini adalah : ",0
	pesanNilai4	db "Rata-rata nilai yang anda berikan adalah                 : ",0
	pesanNilai5	db "Nilai Kepuasan      : ",0
	pesanNilai6	db "Nilai User Friendly : ",0
	jwbNilai	db ''
	failed		db 'Hasil lebih besar dari error',10,0
	msg			db '-- Checkbit yang nilai binernya = 1 adalah yang mengalami error --',10,0
	bisaN		db 'BISA',10,0
	c			db 'C',0
	formatOut2  db 'Terima kasih anda telah memberikan komentar ',0
	formatOut   db 'Total Nilai yang anda berikan :   %f', 0xa, 0
	
	; format input dari scanf
    format      db      '%f', 0

    ; untuk clear screen
    clr_scr     db      27, '[H', 27, '[2J', 0
    len_clr_scr equ     $-clr_scr

section .bss
	desimal resd 1
	biner 	resd 1000
	cekbit	resd 1000
	binercb	resd 1000
	jumlah 	resd 1000
	temp	resd 1
	temp2	resd 1
	pilih	resd 1
	data	resd 1
	biteror	resd 1
	nprog	resd 1
	nprog1	resd 1
	jumtemp	resd 1
	result  resd 4
	nilaiP	resd 4
	nilaiU	resd 4
	pluserorcb	resd 1
	floatNum resq 4

section .text
	global main

main:
	; clear screen
    call clrScr
    
	call header
	call menupilih
	
	jmp pilih1
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar

pilih1:
	cmp eax, 1
	jne pilih2
	call konversibiner
	
pilih2:
	cmp eax, 2
	jne beda
	call hamming
	
exit:
	mov eax, 1
	mov ebx, 0
	int 0x80

beda :
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	; Cetak pesan
	mov eax, erorpilih
	mov ebx, 1 ;stdout
	call printStr
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	
	jmp exit
