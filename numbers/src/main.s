%macro print 2
	mov ecx, %1 
	mov edx, %2 
	mov ebx, 1	         ; file descriptor (stdout)
	mov eax, 4	         ; system call number (sys_write)
	int 0x80	         ; call kernel	
%endmacro
	
section	.text
global _start

_start:
	call math
	print msg, msg_len
	print sum, 1
	print nl, nl_len
	call exit

math:
	mov eax, '3'
	mov ebx, '4'
	add eax, ebx
	sub eax, '3'
	mov [sum], eax		 ; stores result in [sum]
	ret

exit:
	mov eax, 1	         ; system call number (sys_exit)
	int 0x80	         ; call kernel
	ret
	
section	.data
	msg db "The sum is: "
	msg_len equ $ - msg
	nl db 0xA, 0xD
	nl_len equ $ - nl

section	.bss
	sum resb 1

