global print_char

section .text
; Imprime el carácter almacenado en el registro AL.
print_char:
    push ebp
    mov ebp, esp
    
    push eax            ; Guardar el carácter en la pila
    
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, esp        ; Apuntamos al carácter en la pila
    mov edx, 1          ; Imprimir 1 byte
    int 0x80            ; Llamada al sistema
    
    pop eax             ; Restauramos el registro
    
    mov esp, ebp
    pop ebp
    ret
