global newline
extern print_char

section .text
; Imprime un salto de línea.
newline:
    push ebp
    mov ebp, esp
    
    push eax
    
    mov al, 10          ; ASCII para salto de línea (\n)
    call print_char
    
    pop eax
    
    mov esp, ebp
    pop ebp
    ret
