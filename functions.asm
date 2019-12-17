;------------------------------------------
; int slen(String message)
; String length calculation function
slen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret

;------------------------------------------
; void sprint(String message)
; String printing function
sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax		;saves the register pon the stack
    call    slen	;if eax holds the base address of a string then length of the string is calculated

    mov     edx, eax	;length of string stored into edx follwing system call conventions
    pop     eax		;base address restored to eax

    mov     ecx, eax	;base address passed into register ecx
    mov     ebx, 1
    mov     eax, 4	;4 is the id of the printing system call
    int     80h		;string is printed

    pop     ebx		;register values are restored
    pop     ecx
    pop     edx
    ret
 
 
;------------------------------------------
;Exit program
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret
