TITLE 03
.model small

.data
  num1 db ?
  num2 db ?
  msg1 db "Digite um primeiro numero (0-9): $"
  msg2 db "Digite um segundo numero (0-9): $"
  resultado db "A some dos dois numeros eh: $"
  res db ?

.code
main proc
  mov ax, @data
  mov ds, ax

  ; imprime msg1
  mov ah, 9h
  lea dx, msg1
  int 21h

  ; le num1
  mov ah, 1h
  int 21h
  mov num1, al

  ; nova linha
  mov ah, 2h
  mov dl, 10
  int 21h

  ; imprime num2
  mov ah, 9h
  lea dx, msg2
  int 21h

  ; le msg2
  mov ah, 1h
  int 21h
  mov num2, al

  mov ah, 2h  
  mov dl, 10
  int 21h

  ; imprime mensagem do resultado
  mov ah, 9h
  lea dx, resultado
  int 21h

  sub num1, 48
  sub num2, 48

  mov bl, num1
  mov bh, num2

  add bl, bh
  add bl, 48

  ; imprime resultado
  mov ah, 2h
  mov dl, bl
  int 21h

  mov ah, 4Ch
  int 21h
main endp
end main