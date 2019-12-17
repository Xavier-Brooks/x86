section .data
msg db "Hello World! how are you.", 0Ah ;defines bytes in memory for each character in the string and the carriage return

section .txt
global _start: ;tells the program where to start execution

_start:

	mov eax, msg	;eax is the parameter register for our subroutine that holds the base address of the string
	call strlen	;calls the subroutine to calculate string length

	mov edx, eax	;movs string length into edx register
        mov ecx, msg	;places msg base address into the ecx register
        mov ebx, 1
        mov eax, 4
        int 80h

	mov ebx, 0	;exits the program
	mov eax, 1
	int 80h

strlen:
	push ebx	;preserves the value of ebx in our program by pushing it to the stack
	mov ebx, eax	;copies the base address of the string into ebx

nextchar:
	cmp byte[eax],0 ;checks if the next byte of the string is the null byte that signals the end of a string
	jz Finished	;if the end is reached jump to the end of the subroutine
	inc eax		;eax will point to the character byte in memory
	jmp nextchar	;loops back to check if the next byte in memory is the null byte

Finished:
	sub eax, ebx 	;# of bytes in the string is calculated by subtracting the start address of the string from the end address
	pop ebx		;restores the registers previous value
	ret		;return to the calling rountine


