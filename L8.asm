%include 'functions.asm'

section .text
global _start

_start:

	pop ecx		;when arguments are passed form the command line the amount of arguments are the first on the stack

nextarg:

	cmp ecx, 0h
	jz noArgs	;all arguments have been accounted for
	pop eax		;address of each argument is placed into eax
	call sprintLF	;prints each argument then performs a line feed
	dec ecx		;ecx is decremented to show that an argument has bee handled
	jmp nextarg
noArgs:			;all arguments have been handled exit the proram
	call quit
