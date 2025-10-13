TITLE ex4
.model small

.data
  msg1 db 'Digite o primeiro numero: $'
  msg2 db 'Digite o segundo numero: $'
  msgresultado db 'O produto dos dois numeros eh: $'
  num1 db ?
  num2 db ?
  dezena db ?
  unidade db ?

.code
main proc
  mov ax, @data
  mov ds, ax

  mov ah, 9
  lea dx, msg1
  int 21h

  mov ah, 1
  int 21h
  mov num1, al

  mov ah, 2
  mov dl, 10
  int 21h

  mov ah, 9
  lea dx, msg2
  int 21h

  mov ah, 1
  int 21h
  mov num2, al

  sub num1, 30h
  sub num2, 30h
  
  mov ah, 0
  mov al, num2
  mul num1

  mov bl, 10
  mov bh, 0

  div bl

  mov dezena, al
  mov unidade, ah

  mov ah, 2
  mov dl, 10
  int 21h

  mov ah, 9
  lea dx, msgresultado
  int 21h

  add dezena, 30h
  add unidade, 30h

  cmp dezena, 30h  
  je display_units

  mov ah, 2
  mov dl, dezena
  int 21h

  display_units:
    mov ah, 2
    mov dl, unidade
    int 21h

  mov ah, 4Ch
  int 21h
main endp
end main