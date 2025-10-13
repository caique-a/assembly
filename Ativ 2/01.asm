TITLE "Atividade 2"
.MODEL SMALL

.data
  msg1 db "Digite uma letra minuscula: $"
  msg2 db "A letra maiuscula correspondente eh: $"
  char db ?

.code
main proc
  mov ax, @data
  mov ds, ax

  lea dx, msg1
  mov ah, 9h
  int 21h

  mov ah, 1h
  int 21h
  mov char, al

  mov dl, 0Ah
  int 21h

  lea dx, msg2
  mov ah, 9h
  int 21h

  sub char, 32

  mov ah, 2h
  mov dl, char
  int 21h

  mov ah, 4Ch
  int 21h
main endp
end main