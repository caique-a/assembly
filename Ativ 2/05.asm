TITLE ex5
.model small
.stack 100h

count = 80
KEYBOARD STRUCT
  maxInput byte count ; max chars to input
  inputCount byte ? ; actual input count
  buffer byte count dup(?) ; holds input
KEYBOARD ENDS

.data
  msg1 db 'Digite uma palavra minuscula (max 5 caracteres): $'
  msg2 db 'A palavra maiuscula invertida eh: $'
  kybdData KEYBOARD <>

.code
main proc
  mov ax, @data
  mov ds, ax

  mov ah, 9h
  lea dx, msg1
  int 21h

  mov ah, 0Ah
  mov dx, offset kybdData
  int 21h

  mov ah, 4Ch
  int 21h
main endp
end main