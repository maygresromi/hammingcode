hamming:
    ; Cetak Newline (ascii = 10)
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
    ; Cetak pesan
	mov eax, pesan3
	mov ebx, 1 ;stdout
	call printStr
	
    mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
    ; Cetak pesan
	mov eax, pesan4
	mov ebx, 1 ;stdout
	call printStr
	
	; Scan jumlah data
	call scanNum
	mov dword [data], eax

	; Cetak pesan
	mov eax, pesan5
	mov ebx, 1 ;stdout
	call printStr
	
	; scan bit yang error
	call scanNum
	mov dword [biteror], eax
    
    mov eax, [data]
    mov ecx, [biteror]
    
	; cek apakah error <= data
	cmp eax,ecx
    jl gagal
    
    call errorlebihbesarhasil
    
;jalankan ini ketika bit eror tidak lebih besar dari data       
errorlebihbesarhasil:
	mov eax, [jumcek]
	cmp eax, 0
	je jumcek0
	
	cmp eax, 1
	je jumcek1
	
	
	cmp eax, 2
	jge jumcekN
	
ret
	
jumcek0:
	mov eax, [jumcek]
	add eax, 1
	mov dword[jumcek], eax
	
	;i++
	mov eax, [i]
	mov ecx, [jum]
	mov dword[cekbit+4*eax], ecx
	
	inc eax
	mov dword[i],eax
	
	jmp errorlebihbesarhasil
   
jumcek1:
	;jumcek ++
	mov eax, [jumcek]
	add eax, 1
	mov dword[jumcek], eax
	
	
	mov ecx, [jum]
	inc ecx
		
	mov eax, [i]
	
	mov dword[cekbit+4*eax], ecx
	
	;i++
	inc eax
	mov dword[i],eax
	
	jmp errorlebihbesarhasil
	
jumcekN:	
	
	call loopjum
		
	mov eax, [jum]
	cmp eax, [biteror]
	jg jumlebihbesareror
	
	;i++
	mov eax, [i]
	mov ecx, [jum]
	mov dword[cekbit+4*eax], ecx
	
	inc eax
	mov dword[i],eax
	
	;jumcek ++
	xor eax, eax
	mov eax, [jumcek]
	add eax, 1
	mov dword[jumcek], eax
		
	jmp jumcekN
	
jumlebihbesareror:	
	;i++
	mov eax, [i]
	mov ecx, [jum]
	mov dword[cekbit+4*eax], ecx
	
	inc eax
	mov dword[i], eax
	mov dword[x], eax
	
	mov eax, [hasil]
	mov ecx, [biteror]
	cmp eax, ecx
	jg konversibit
	
	jmp jumcekN
	
    
gagal:
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
    ; Cetak pesan
	mov eax, pesan6
	mov ebx, 1 ;stdout
	call printStr
	jmp exit
	
gagal2:
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
    ; Cetak pesan
	mov eax, failed
	mov ebx, 1 ;stdout
	call printStr
	jmp exit

selesai:
    mov eax, pesandone
	mov ebx, 1 ;stdout
	call printStr
	jmp exit
	
konversibit:
	mov eax, [jumcek]
	mov dword[temp], eax
	
	;mov ebx, 1
	;call printNum
	
	;mov eax, [i]
	;mov ebx, 1
	;call printNum
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar	
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar	
	
	; Cetak pesan1
	mov eax, msg
	mov ebx, 1 ;stdout
	call printStr
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar	
	
	jmp bit
	
bit:
	mov eax, [biteror]
	mov ecx, [temp]
	add eax, ecx
	
	mov dword[pluserorcb], eax
	
	xor ecx,ecx
	xor ebx,ebx
	
	mov ebx, [bagi]
	call iterasi
	
	mov eax, [jumlah]
	mov dword[jumtemp], eax
	mov ecx, [jumcek]
	cmp eax, ecx
	je cetakbit
		
	jmp cetakbit2
	
cetakbit:	
	; Cetak pesan1
	mov eax, c
	mov ebx, 1 ;stdout
	call printStr
	
	mov eax, [jumcek]
	dec eax
	mov ecx, eax
	
	xor eax, eax	
	mov eax, [cekbit+4*ecx]
	mov dword[jumcek], ecx
	mov ebx, 1 ;stdout
	call printNum
	
	mov al, ' '
	mov ebx, 1 ;stdout
	call printChar
	
	mov al, ' '
	mov ebx, 1 ;stdout
	call printChar
	
	xor ecx,ecx
	xor eax,eax
	mov eax,[jumcek]
	cmp eax,0
	jg cetakbit
		
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar	
	
	jmp cetak

cetakbit2:	
	; Cetak pesan1
	mov eax, c
	mov ebx, 1 ;stdout
	call printStr
	
	mov eax, [jumtemp]
	dec eax
	mov ecx, eax
	
	xor eax, eax	
	mov eax, [cekbit+4*ecx]
	mov dword[jumtemp], ecx
	mov ebx, 1 ;stdout
	call printNum
	
	mov al, ' '
	mov ebx, 1 ;stdout
	call printChar
	
	mov al, ' '
	mov ebx, 1 ;stdout
	call printChar
	
	xor ecx,ecx
	xor eax,eax
	mov eax,[jumtemp]
	cmp eax,0
	jg cetakbit2
		
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar	
	
	jmp cetak

cetak:
	mov eax, [jumlah]
	dec eax
	mov ecx, eax
	
	xor eax, eax
	
	mov eax, [biner+4*ecx]
	mov dword[jumlah], ecx
	mov ebx, 1 ;stdout
	call printNum
	
	mov al, ' '
	mov ebx, 1 ;stdout
	call printChar
	
	mov al, ' '
	mov ebx, 1 ;stdout
	call printChar
	
	mov al, ' '
	mov ebx, 1 ;stdout
	call printChar
	
	mov al, ' '
	mov ebx, 1 ;stdout
	call printChar
	
	xor ecx,ecx
	xor eax,eax
	mov eax,[jumlah]
	cmp eax,0
	jg cetak

	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	call kuisioner

	; Cetak Newline (ascii = 10)
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
		
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	jmp exit
