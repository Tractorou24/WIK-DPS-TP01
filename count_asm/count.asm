  BITS 32
            org     0x00010000

            db      0x7F, "ELF"             ; e_ident
            dd      1                                       ; p_type
            dd      0                                       ; p_offset
            dd      $$                                      ; p_vaddr 
            dw      2                       ; e_type        ; p_paddr
            dw      3                       ; e_machine
            dd      _start                  ; e_version     ; p_filesz
            dd      _start                  ; e_entry       ; p_memsz
            dd      4                       ; e_phoff       ; p_flags
            mov     bl, 42                  ; e_shoff       ; p_align
            xor     eax, eax
            inc     eax                     ; e_flags
            int     0x80
            db      0
            dw      0x34                    ; e_ehsize
            dw      0x20                    ; e_phentsize
            dw      1                       ; e_phnum
            dw      0                       ; e_shentsize
            dw      0                       ; e_shnum
            dw      0                       ; e_shstrndx
_start:
    mov eax, 1
    mov esi, eax
loop:
    ; Convert EAX to ASCII and store it onto the stack
    mov ecx, 10
    mov ebx, 16
    .L1:
    xor edx, edx            ; Don't forget it!
    div ecx                 ; Extract the last decimal digit
    or dl, 0x30             ; Convert remainder to ASCII
    sub ebx, 1
    mov [esp+ebx], dl       ; Store remainder on the stack (reverse order)
    test eax, eax           ; Until there is nothing left to divide
    jnz .L1

    sub ebx, 1
    mov dl, 0x0a
    mov [esp+ebx], dl       ; Store a space on the stack

    mov eax, 4              ; SYS_WRITE
    lea ecx, [esp+ebx]      ; Pointer to the first ASCII digit
    mov edx, 16
    sub edx, ebx            ; Count of digits
    mov ebx, 1              ; STDOUT
    int 0x80                ; Call 32-bit Linux

    inc esi
    mov eax, esi
    cmp eax, 10000
    jle loop

    mov	ebx,0
	mov	eax,1
	int	0x80

  filesize      equ     $ - $$
