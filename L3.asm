section .data
msg db "Hello World! how are you.", 0Ah ;defines bytes in memory for each character in the string and the carriage return

section .txt
global _start: ;tells the program where to start execution

_start:

	mov ebx, msg
	mov eax, ebx ;both eax and ebx hold the base address of the message above to be printed

nextchar:
	cmp byte[eax],0 ;checks if the next byte of the string is the null byte that signals the end of a string
	jz Finished	;if the end is reached jumped to the printing system call
	inc eax		;eax will point to the character byte in memory
	jmp nextchar	;loops back to check if the next byte in memory is the null byte

Finished:
	sub eax, ebx 	;# of bytes in the string is calculated by subtracting the start address of the string from the end address
	mov edx, eax
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 80h

	mov ebx, 0   	;system_exit sys call to stop the program
	mov eax, 1
	int 80h
