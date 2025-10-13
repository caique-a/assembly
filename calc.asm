.model small
.data
    prompt db 'Enter a number: $'
    buffer db 6, ?, 6 dup(0)
    result dw 0
    newline db 0Dh, 0Ah, '$'

.code
;main proc for the program, display prompt, get input
main PROC
    mov ax, @data
    mov ds, ax

    mov dx, offset prompt
    mov ax, 09h
    int 21h

    mov dx, offset buffer
    mov ah, 0Ah
    int 21h

    jmp ascii_to_number

    ascii_to_number:
        xor ax, ax
        mov si, offset buffer + 2
        xor bx, bx
        convert_loop:
            mov cl, [si]
            cmp cl, 0Dh
            je done
            cmp cl, 0
            je done
            sub cl, '0'
            cmp cl, 9
            ja error
            mov ax, bx
            mov bx, 10
            mul bx
            add ax, cx
            mov bx, ax
            inc si
            jmp convert_loop
        error:
            mov bx, 0
        done:
            mov result, bx
main ENDP
end main