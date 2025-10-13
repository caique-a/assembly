TITLE Adittion
.MODEL small

.CODE
MAIN PROC
    MOV AX, 5
    MOV BX, 3
    ADD AX, BX
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
end MAIN