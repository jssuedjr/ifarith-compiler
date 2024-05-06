section .data
	int_format db "%ld",10,0


	global _main
	extern _printf
section .text


'(call "_main")'(mov "rax" "60")'(xor "rdi" "rdi")'syscall_start:	call _main
	mov rax, 60
	xor rdi, rdi
	syscall


'(push "rbp")'(mov "rbp" "rsp")'(sub "rsp" "416")'(mov "esi" "1")'(mov "[rbp-136]" "esi")'(mov "esi" "[rbp-136]")'(mov "[rbp-120]" "esi")'(mov "esi" "2")'(mov "[rbp-96]" "esi")'(mov "esi" "[rbp-96]")'(mov "[rbp-64]" "esi")'(mov "esi" "[rbp-120]")'(mov "[rbp-56]" "esi")'(mov "edi" "[rbp-64]")'(mov "eax" "[rbp-56]")'(add "eax" "edi")'(mov "[rbp-56]" "eax")'(mov "esi" "[rbp-56]")'(mov "[rbp-48]" "esi")'(mov "esi" "2")'(mov "[rbp-32]" "esi")'(mov "esi" "[rbp-32]")'(mov "[rbp-16]" "esi")'(mov "esi" "[rbp-48]")'(mov "[rbp-152]" "esi")'(mov "edi" "[rbp-16]")'(mov "eax" "[rbp-152]")'(imul "eax" "edi")'(mov "[rbp-152]" "eax")'(mov "esi" "[rbp-152]")'(mov "[rbp-104]" "esi")'(mov "esi" "[rbp-104]")'(mov "[rbp-144]" "esi")'(mov "edi" "[rbp-48]")'(mov "eax" "[rbp-144]")'(imul "eax" "edi")'(mov "[rbp-144]" "eax")'(mov "esi" "[rbp-144]")'(mov "[rbp-208]" "esi")'(mov "esi" "13")'(mov "[rbp-200]" "esi")'(mov "esi" "[rbp-200]")'(mov "[rbp-192]" "esi")'(mov "esi" "[rbp-104]")'(mov "[rbp-184]" "esi")'(mov "edi" "[rbp-192]")'(mov "eax" "[rbp-184]")'(add "eax" "edi")'(mov "[rbp-184]" "eax")'(mov "esi" "[rbp-184]")'(mov "[rbp-176]" "esi")'(mov "esi" "5")'(mov "[rbp-168]" "esi")'(mov "esi" "[rbp-168]")'(mov "[rbp-160]" "esi")'(mov "esi" "[rbp-48]")'(mov "[rbp-128]" "esi")'(mov "edi" "[rbp-160]")'(mov "eax" "[rbp-128]")'(add "eax" "edi")'(mov "[rbp-128]" "eax")'(mov "esi" "[rbp-128]")'(mov "[rbp-112]" "esi")'(mov "esi" "[rbp-176]")'(mov "[rbp-88]" "esi")'(mov "edi" "[rbp-112]")'(mov "eax" "[rbp-88]")'(add "eax" "edi")'(mov "[rbp-88]" "eax")'(mov "esi" "[rbp-88]")'(mov "[rbp-80]" "esi")'(mov "esi" "[rbp-104]")'(mov "[rbp-40]" "esi")'(mov "edi" "[rbp-80]")'(mov "eax" "[rbp-40]")'(add "eax" "edi")'(mov "[rbp-40]" "eax")'(mov "esi" "[rbp-40]")'(mov "[rbp-24]" "esi")'(mov "esi" "[rbp-208]")'(mov "[rbp-8]" "esi")'(mov "edi" "[rbp-24]")'(mov "eax" "[rbp-8]")'(add "eax" "edi")'(mov "[rbp-8]" "eax")'(mov "esi" "[rbp-8]")'(mov "[rbp-72]" "esi")'(mov "esi" "[rbp-72]")'(lea "rdi" "[rel int_format]")'(mov "eax" "0")'(call "_printf")'(mov "rax" "0")'(jmp "finish_up")'((label "finish_up") (add "rsp" "416"))'(add "rsp" "416")'(leave)'(ret)_main:	push rbp
	mov rbp, rsp
	sub rsp, 416
	mov esi, 1
	mov [rbp-136], esi
	mov esi, [rbp-136]
	mov [rbp-120], esi
	mov esi, 2
	mov [rbp-96], esi
	mov esi, [rbp-96]
	mov [rbp-64], esi
	mov esi, [rbp-120]
	mov [rbp-56], esi
	mov edi, [rbp-64]
	mov eax, [rbp-56]
	add eax, edi
	mov [rbp-56], eax
	mov esi, [rbp-56]
	mov [rbp-48], esi
	mov esi, 2
	mov [rbp-32], esi
	mov esi, [rbp-32]
	mov [rbp-16], esi
	mov esi, [rbp-48]
	mov [rbp-152], esi
	mov edi, [rbp-16]
	mov eax, [rbp-152]
	imul eax, edi
	mov [rbp-152], eax
	mov esi, [rbp-152]
	mov [rbp-104], esi
	mov esi, [rbp-104]
	mov [rbp-144], esi
	mov edi, [rbp-48]
	mov eax, [rbp-144]
	imul eax, edi
	mov [rbp-144], eax
	mov esi, [rbp-144]
	mov [rbp-208], esi
	mov esi, 13
	mov [rbp-200], esi
	mov esi, [rbp-200]
	mov [rbp-192], esi
	mov esi, [rbp-104]
	mov [rbp-184], esi
	mov edi, [rbp-192]
	mov eax, [rbp-184]
	add eax, edi
	mov [rbp-184], eax
	mov esi, [rbp-184]
	mov [rbp-176], esi
	mov esi, 5
	mov [rbp-168], esi
	mov esi, [rbp-168]
	mov [rbp-160], esi
	mov esi, [rbp-48]
	mov [rbp-128], esi
	mov edi, [rbp-160]
	mov eax, [rbp-128]
	add eax, edi
	mov [rbp-128], eax
	mov esi, [rbp-128]
	mov [rbp-112], esi
	mov esi, [rbp-176]
	mov [rbp-88], esi
	mov edi, [rbp-112]
	mov eax, [rbp-88]
	add eax, edi
	mov [rbp-88], eax
	mov esi, [rbp-88]
	mov [rbp-80], esi
	mov esi, [rbp-104]
	mov [rbp-40], esi
	mov edi, [rbp-80]
	mov eax, [rbp-40]
	add eax, edi
	mov [rbp-40], eax
	mov esi, [rbp-40]
	mov [rbp-24], esi
	mov esi, [rbp-208]
	mov [rbp-8], esi
	mov edi, [rbp-24]
	mov eax, [rbp-8]
	add eax, edi
	mov [rbp-8], eax
	mov esi, [rbp-8]
	mov [rbp-72], esi
	mov esi, [rbp-72]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 416
	leave 
	ret 

