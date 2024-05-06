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
	sub rsp, 144
	mov esi, 0
	mov [rbp-48], esi
	mov esi, [rbp-48]
	mov [rbp-40], esi
	mov esi, 0
	mov [rbp-56], esi
	mov edi, [rbp-56]
	mov eax, [rbp-40]
	cmp eax, edi
	mov [rbp-40], eax
	jz lab1234
	jmp lab1237
lab1234:	mov esi, 1
	mov [rbp-32], esi
	mov esi, [rbp-32]
	mov [rbp-24], esi
	mov esi, [rbp-24]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1237:	mov esi, 0
	mov [rbp-16], esi
	mov esi, [rbp-16]
	mov [rbp-8], esi
	mov esi, [rbp-8]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 144
	leave 
	ret 

