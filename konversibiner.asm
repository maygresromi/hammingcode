konversibiner:
	; Cetak Newline (ascii = 10)
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	; Cetak pesan
	mov eax, pesan
	mov ebx, 1 ;stdout
	call printStr
	
	; Cetak Newline (ascii = 10)
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	; Cetak pesan1
	mov eax, pesan1
	mov ebx, 1 ;stdout
	call printStr  
	
	; Scan desimal
	call scanNum
	mov dword [desimal], eax
	
	xor ecx,ecx
	xor ebx,ebx
	
	mov ebx, [bagi]
	call iterasi2
	
	xor eax, eax
	call cetakbiner

	mov al, 10
	mov ebx, 1 ;stdout
	call printChar

	; Cetak Newline (ascii = 10)
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	call kuisioner
	
ret
