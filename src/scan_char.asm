global scan_char

section .text
; Lee un carácter desde la entrada estándar y lo retorna en AL.
scan_char:
    push ebp
    mov ebp, esp
    
    sub esp, 4          ; Reservamos espacio en la pila
    
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, esp        ; Guardar en el espacio reservado
    mov edx, 1          ; Leer 1 byte
    int 0x80
    
    mov al, [esp]       ; Mover el carácter leído a AL
    
    mov esp, ebp
    pop ebp
    ret
