TITLE TESTE
.MODEL small

.CODE
MAIN PROC
    MOV AH, 2
    MOV DL, 30h

    MOV CX, 10 

    print_all:
        INT 21h
        MOV BL, DL
        MOV DL, 10
        INT 21h
        INC BL
        MOV DL, BL
        LOOP print_all
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN