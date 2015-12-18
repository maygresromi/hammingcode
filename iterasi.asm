iterasi:
	; fungsi untuk membagi bilangan dengan 2 dan hasilnya disimpan dalam array
	xor edx,edx
	idiv ebx
	mov dword[biner+4*ecx],edx
	inc ecx
	mov dword[jumlah],ecx
	cmp eax,0
	jnz iterasi
	
	; Cetak pesan1
	;mov eax, pesan2
	;mov ebx, 1 ;stdout
	;call printStr

ret
