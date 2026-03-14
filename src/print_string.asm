SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0global print_string

section .text
; Imprime una cadena terminada en cero recibiendo su dirección en EAX.
print_string:
    push ebp
    mov ebp, esp
    
    push ebx
    push ecx
    push edx
    
    mov ecx, eax        ; ECX = dirección de la cadena
    mov edx, 0          ; EDX = contador de longitud
    
.calcular_longitud:
    cmp byte [ecx + edx], 0
    je .imprimir
    inc edx
    jmp .calcular_longitud
    
.imprimir:
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    int 0x80
    
    pop edx
    pop ecx
    pop ebx
    
    mov esp, ebp
    pop ebp
    ret
; ---------------------------------

print_string:

    push ebp
    mov ebp, esp

    ; TODO:
    ; 1. calcular longitud
    ; 2. syscall write

    mov esp, ebp
    pop ebp
    ret
