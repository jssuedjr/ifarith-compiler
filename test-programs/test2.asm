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
	sub rsp, 400
	mov esi, 3
	mov [rbp-152], esi
	mov esi, 0
	mov [rbp-56], esi
	mov edi, [rbp-56]
	mov eax, [rbp-152]
	cmp eax, edi
	mov [rbp-152], eax
	jz lab1271
	jmp lab1273
lab1271:	mov esi, 1
	mov [rbp-16], esi
	mov esi, [rbp-16]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1273:	mov esi, 2
	mov [rbp-144], esi
	mov esi, 3
	mov [rbp-136], esi
	mov esi, [rbp-144]
	mov [rbp-120], esi
	mov edi, [rbp-136]
	mov eax, [rbp-120]
	add eax, edi
	mov [rbp-120], eax
	mov esi, 0
	mov [rbp-72], esi
	mov edi, [rbp-72]
	mov eax, [rbp-120]
	cmp eax, edi
	mov [rbp-120], eax
	jz lab1277
	jmp lab1279
lab1277:	mov esi, 2
	mov [rbp-200], esi
	mov esi, [rbp-200]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1279:	mov esi, 5
	mov [rbp-104], esi
	mov esi, 2
	mov [rbp-88], esi
	mov esi, -2
	mov [rbp-64], esi
	mov esi, [rbp-88]
	mov [rbp-48], esi
	mov edi, [rbp-64]
	mov eax, [rbp-48]
	add eax, edi
	mov [rbp-48], eax
	mov esi, [rbp-104]
	mov [rbp-192], esi
	mov edi, [rbp-48]
	mov eax, [rbp-192]
	imul eax, edi
	mov [rbp-192], eax
	mov esi, 0
	mov [rbp-96], esi
	mov edi, [rbp-96]
	mov eax, [rbp-192]
	cmp eax, edi
	mov [rbp-192], eax
	jz lab1285
	jmp lab1290
lab1285:	mov esi, 1
	mov [rbp-184], esi
	mov esi, [rbp-184]
	mov [rbp-32], esi
	mov esi, 1
	mov [rbp-176], esi
	mov esi, [rbp-32]
	mov [rbp-168], esi
	mov edi, [rbp-176]
	mov eax, [rbp-168]
	add eax, edi
	mov [rbp-168], eax
	mov esi, [rbp-168]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1290:	mov esi, 4
	mov [rbp-24], esi
	mov esi, [rbp-24]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 400
	leave 
	ret 

