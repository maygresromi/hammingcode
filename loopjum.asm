loopjum:
	mov eax, [jum]
	
	mov ebx, 2
	mul ebx
	
	mov dword[jum], eax
	mov dword[hasil], eax
	
	mov ecx, [j]
	inc ecx
	mov dword[j], ecx
	
	cmp ecx, [jumcek]
	jne loopjum
ret
