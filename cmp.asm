TITLE CMP
.MODEL small

.CODE
MAIN PROC
    MOV AX, 10
    MOV BX, 9
    CMP AX, BX
    jg greater
    MOV CX, 0
    jmp done
    greater:
        MOV CX, 2
        jmp done
    done:
        MOV AH, 9Ch
        INT 21h
MAIN ENDP
end MAIN