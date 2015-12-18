cetakbiner:
	mov eax, [jumlah]
	dec eax
;	mov dword[temp], eax
	mov ecx, eax
	
	xor eax, eax
	
	mov eax, [biner+4*ecx]
	mov dword[jumlah], ecx
	mov ebx, 1 ;stdout
	call printNum
	
	xor ecx,ecx
	xor eax,eax
	mov eax,[jumlah]
	cmp eax,0
	jg cetakbiner

ret