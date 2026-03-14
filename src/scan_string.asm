global scan_string

section .text
; Lee una cadena (EAX = destino, EBX = tamaño máximo) y la termina en cero.
scan_string:
    push ebp
    mov ebp, esp
    
    push ebx
    push ecx
    push edx
    
    mov ecx, eax        ; Dirección del buffer
    mov edx, ebx        ; Tamaño máximo
    dec edx             ; Reservar espacio para el cero
    
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    int 0x80
    
    cmp eax, 0
    jle .fin
    
    cmp byte [ecx + eax - 1], 10
    jne .poner_cero
    mov byte [ecx + eax - 1], 0
    jmp .fin
    
.poner_cero:
    mov byte [ecx + eax], 0
    
.fin:
    pop edx
    pop ecx
    pop ebx
    
    mov esp, ebp
    pop ebp
    ret
