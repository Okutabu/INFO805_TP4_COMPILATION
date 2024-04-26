DATA SEGMENT 
	a DD
	b DD
	aux DD
DATA ENDS 
CODE SEGMENT
		mov a, eax
		mov b, eax
	etiq_debut_while_0:
		mov eax, 0
		push eax
		mov eax, b
		push eax
		pop ebx
		pop eax
		sub eax, ebx
		push eax
		jl etiq_debut_lt_1
		mov eax,0
		jmp etiq_fin_lt_1
	etiq_debut_lt_1:
		mov eax,1
	etiq_fin_lt_1:
		jz etiq_fin_while_0
		mov aux, eax
		mov eax, b
		push eax
		mov a, eax
		mov eax, aux
		push eax
		mov b, eax
		jmp etiq_debut_while_0
	etiq_fin_while_0:
CODE ENDS