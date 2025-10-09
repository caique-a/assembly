title jogo da velha
.model small
.stack 100h

.data
  tabuleiro db 0,0,0
            db 0,0,0
            db 0,0,0
  mensagemEntradaLinha db 'Insira a linha de entrada (1 - 3): $'
  mensagemEntradaColuna db 'Insira a coluna de entrada (1 - 3): $'
  linha db ?
  coluna db ?

.code
nl proc
  mov ah, 2
  mov dl, 13
  int 21h
  mov dl, 10
  int 21h
  ret
nl endp
print_tabuleiro proc
  ; Guarda os valores dos registradores
  push ax
  push bx
  push cx
  push dx

  xor bx, bx ; coluna
  mov di, 3 ; numero de linhas
  
  loop_linha:
  xor si, si
  mov cx, 3 ; numero de elementos da linha

  loop_coluna:
  mov dl, tabuleiro[bx][si]
  or dl, 30h
  mov ah, 2
  int 21h
  mov dl, ' '
  int 21h
  inc si
  loop loop_coluna

  call nl
  
  add bx, 3
  dec di
  jnz loop_linha
  
  pop dx
  pop cx
  pop bx
  pop ax
  ret
print_tabuleiro endp
main proc
  mov ax, @data ; Inicializa segmento de dados
  mov ds, ax

  ; Ciclo de jogo principal, entra linha/coluna coloca símbolo correto, verifica vitória ou empate
  main_loop:
  call print_tabuleiro

  call nl

  lea dx, mensagemEntradaLinha
  mov ah, 9
  int 21h

  mov ah, 1
  int 21h
  mov linha, al

  call nl

  lea dx, mensagemEntradaColuna
  mov ah, 9
  int 21h

  mov ah, 1
  int 21h
  mov coluna, al

  call nl

  and linha, 0Fh
  and coluna, 0Fh

  dec linha
  dec coluna

  ; Adiciona X ou O na matriz

  ; Verifica se alguem ganhou, se X ganhou, ax = 1, se O ganhou, ax = 2, se ninguém ganhou, ax = 0

  ; Verifica se empatou

  jmp main_loop

  mov ah, 4ch ; Fim do programa
  int 21h
main endp
end main