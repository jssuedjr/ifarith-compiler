section .data
	int_format db "%ld",10,0


	global _main
	extern _printf
section .text


_start:	call _main
	mov rax, 60
	xor rdi, rdi
	syscall


_main:	push rbp
	mov rbp, rsp
	sub rsp, 416
	mov esi, 5
	mov [rbp-16], esi
	mov esi, 2
	mov [rbp-160], esi
	mov esi, 3
	mov [rbp-152], esi
	mov esi, [rbp-160]
	mov [rbp-208], esi
	mov edi, [rbp-152]
	mov eax, [rbp-208]
	imul eax, edi
	mov [rbp-208], eax
	mov esi, [rbp-16]
	mov [rbp-200], esi
	mov edi, [rbp-208]
	mov eax, [rbp-200]
	sub eax, edi
	mov [rbp-200], eax
	mov esi, 0
	mov [rbp-56], esi
	mov edi, [rbp-56]
	mov eax, [rbp-200]
	cmp eax, edi
	mov [rbp-200], eax
	jz lab1277
	jmp lab1279
lab1277:	mov esi, 1
	mov [rbp-144], esi
	mov esi, [rbp-144]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1279:	mov esi, 2
	mov [rbp-192], esi
	mov esi, 3
	mov [rbp-128], esi
	mov esi, [rbp-192]
	mov [rbp-184], esi
	mov edi, [rbp-128]
	mov eax, [rbp-184]
	add eax, edi
	mov [rbp-184], eax
	mov esi, 0
	mov [rbp-72], esi
	mov edi, [rbp-72]
	mov eax, [rbp-184]
	cmp eax, edi
	mov [rbp-184], eax
	jz lab1283
	jmp lab1285
lab1283:	mov esi, 2
	mov [rbp-104], esi
	mov esi, [rbp-104]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1285:	mov esi, 5
	mov [rbp-80], esi
	mov esi, 2
	mov [rbp-64], esi
	mov esi, -2
	mov [rbp-176], esi
	mov esi, [rbp-64]
	mov [rbp-48], esi
	mov edi, [rbp-176]
	mov eax, [rbp-48]
	add eax, edi
	mov [rbp-48], eax
	mov esi, [rbp-80]
	mov [rbp-168], esi
	mov edi, [rbp-48]
	mov eax, [rbp-168]
	imul eax, edi
	mov [rbp-168], eax
	mov esi, 0
	mov [rbp-88], esi
	mov edi, [rbp-88]
	mov eax, [rbp-168]
	cmp eax, edi
	mov [rbp-168], eax
	jz lab1291
	jmp lab1293
lab1291:	mov esi, 3
	mov [rbp-32], esi
	mov esi, [rbp-32]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1293:	mov esi, 4
	mov [rbp-8], esi
	mov esi, [rbp-8]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 416
	leave 
	ret 

