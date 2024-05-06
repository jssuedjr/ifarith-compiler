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
	sub rsp, 128
	mov esi, 1
	mov [rbp-8], esi
	mov esi, [rbp-8]
	mov [rbp-40], esi
	mov esi, 1
	mov [rbp-32], esi
	mov esi, 24
	mov [rbp-24], esi
	mov esi, [rbp-32]
	mov [rbp-64], esi
	mov edi, [rbp-24]
	mov eax, [rbp-64]
	add eax, edi
	mov [rbp-64], eax
	mov esi, [rbp-64]
	mov [rbp-40], esi
	mov esi, 3
	mov [rbp-56], esi
	mov esi, [rbp-40]
	mov [rbp-48], esi
	mov edi, [rbp-56]
	mov eax, [rbp-48]
	imul eax, edi
	mov [rbp-48], eax
	mov esi, [rbp-48]
	mov [rbp-16], esi
	mov esi, [rbp-40]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 128
	leave 
	ret 

