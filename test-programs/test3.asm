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
	sub rsp, 304
	mov esi, 2
	mov [rbp-8], esi
	mov esi, [rbp-8]
	mov [rbp-40], esi
	mov esi, 10
	mov [rbp-104], esi
	mov esi, [rbp-104]
	mov [rbp-56], esi
	mov esi, 3
	mov [rbp-96], esi
	mov esi, [rbp-96]
	mov [rbp-112], esi
	mov esi, 0
	mov [rbp-88], esi
	mov esi, [rbp-88]
	mov [rbp-64], esi
	mov esi, 0
	mov [rbp-32], esi
	mov edi, [rbp-32]
	mov eax, [rbp-56]
	cmp eax, edi
	mov [rbp-56], eax
	jz lab1273
	jmp lab1283
lab1273:	mov esi, 1
	mov [rbp-152], esi
	mov esi, [rbp-152]
	mov [rbp-24], esi
	mov esi, 1
	mov [rbp-72], esi
	mov esi, 24
	mov [rbp-144], esi
	mov esi, [rbp-72]
	mov [rbp-136], esi
	mov edi, [rbp-144]
	mov eax, [rbp-136]
	add eax, edi
	mov [rbp-136], eax
	mov esi, [rbp-136]
	mov [rbp-24], esi
	mov esi, 3
	mov [rbp-128], esi
	mov esi, [rbp-24]
	mov [rbp-120], esi
	mov edi, [rbp-128]
	mov eax, [rbp-120]
	imul eax, edi
	mov [rbp-120], eax
	mov esi, [rbp-120]
	mov [rbp-16], esi
	mov esi, [rbp-24]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1283:	mov esi, [rbp-112]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 304
	leave 
	ret 

