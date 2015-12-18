menupilih:

	; Cetak pesan
	mov eax, msg6
	mov ebx, 1 ;stdout
	call printStr
	
	; Cetak pesan
	mov eax, msg7
	mov ebx, 1 ;stdout
	call printStr
	
	; Cetak pesan
	mov eax, msg8
	mov ebx, 1 ;stdout
	call printStr
	
	call scanNum
	mov dword [pilih], eax
	
ret