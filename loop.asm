TITLE looper
.MODEL small

.CODE
MAIN PROC
    MOV AX, 0
    MOV CX, 5
    adder:
        ADD AX, 1
        loop adder
    MOV AH, 9Ch
    INT 21h
MAIN ENDP
end MAIN