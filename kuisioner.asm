kuisioner:	

	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	;Cetak pesanNilai
	mov eax, pesanNilai2
	mov ebx, 1 ;stdout
	call printStr  
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	;Cetak pesanNilai
	mov eax, pesanNilai
	mov ebx, 1 ;stdout
	call printStr  
	
	;baca jawaban survei kepuasan
	call scanStr

	; Copy string ke kata2
	mov ebx, jwbNilai
	call cpyStr
	
	; Cetak pesanNilai
	mov eax, pesanNilai5
	mov ebx, 1 ;stdout
	call printStr 
	
	;nilai kepuasan
	; scanf dengan format %f
    push nilaiP
    push format
    call scanf
    add esp, 8
    
    ; mengubah 32 bit menjadi 64bit
    fld dword[nilaiP]
    fstp qword[floatNum]
    
    ; Cetak pesanNilai
	mov eax, pesanNilai6
	mov ebx, 1 ;stdout
	call printStr 
	
	;nilai kepuasan
	; scanf dengan format %f
    push nilaiU
    push format
    call scanf
    add esp, 8
    
    ; mengubah 32 bit menjadi 64bit
    fld dword[nilaiU]
    fstp qword[floatNum]
    
    fld dword[nilaiU]
    fld dword[nilaiP]
    fadd
    fstp qword[result]
    
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	
    ; Cetak pesanNilai
	mov eax, formatOut2
	mov ebx, 1 ;stdout
	call printStr 
	
	; Cetak pesanNilai
	mov eax, jwbNilai
	mov ebx, 1 ;stdout
	call printStr 
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
    
    ; karena 64 bit, ketika print harus dibagi menjadi 2 bagian
    push dword[result+4]
    push dword[result]
    push dword formatOut
    call printf
    add esp, 12
	
	mov al, 10
	mov ebx, 1 ;stdout
	call printChar
	jmp exit

ret
