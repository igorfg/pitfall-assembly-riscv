.eqv vermelho 0x07
.eqv laranja  0x2F
.eqv amarelo  0x3F
.eqv verde    0x3C
.eqv azul     0xC0
.eqv anil     0x82
.eqv magenta  0xC6

.globl draw_vine

.data
	centro:             .word 12800
	inferior_esquerdo:  .word 0xFF012AC0
	inicio_coordenadas: .word 0xFF000000
	newl: .string "\n"
	virgula: .string ","


.text

draw_vine:
	addi sp, sp, -4   # aloca um espaco na pilha
	sw   ra, 0(sp)    # salva o endereco de retorno na pilha

	addi a0, zero, 80     # raio
	addi a1, zero, 151   # x centro = 160
	addi a2, zero, 60   # y centro = 240-1
	addi a6, zero, 0
	li   a3, vermelho      # carrega a cor 
	jal  ra, coordenadas # chama o metodo que ira desenhar o arco
	
	addi a0, zero, 80     # raio
	addi a1, zero, 151   # x centro = 160
	addi a2, zero, 60   # y centro = 240-1
	addi a6, zero, 1
	li   a3, vermelho      # carrega a cor 
	jal  ra, coordenadas # chama o metodo que ira desenhar o arco
	
	lw ra, 0(sp)   # recupera endereco de retorno
	addi sp, sp, 4 # free na pilha
	ret

coordenadas:
	addi sp, sp, -4   # aloca um espaco na pilha
	sw   ra, 0(sp)    # salva o endereco de retorno na pilha
	add  a4, zero, a3 # salva a cor em a4 para enviar como argumento
	
	add  t0, zero, a0 # salva o valor do raio
	add  t1, zero, a1 # salva o valor de x
	add  t2, zero, a2 # salva o valor de y
	addi t3, zero, 0  # p = 0
	add  t4, zero, a0 # q = r
	add  t5, t0, t0   # 2r
	addi t6, zero, 3  # 3
	sub  t5, t6, t5   # d = 3 - 2r
	
	while: bgt t3, t4, fim_while # while p <= q
		addi sp, sp, -16     # abre um espaco na pilha
		sw   t0, 0(sp)       # salva o valor de r na pilha
		sw   t1, 4(sp)       # salva o valor de x na pilha
		sw   t2, 8(sp)       # salva o valor de y na pilha
		sw   t3, 12(sp)      # salva o valor de p na pilha
	
		add a0, zero, t1    # x
		add a1, zero, t2    # y
		add a2, zero, t3    # p
		add a3, zero, t4    # q
		
		beq a6, zero, draw_first
		jal ra, draw_vine2
		jal zero, continue_loop
		
	    draw_first: jal ra, draw_vine1 # desenha pixels
	    
		continue_loop:
		lw   t3, 12(sp)      # recupera o valor de p
		lw   t2, 8(sp)       # recupera o valor de y
		lw   t1, 4(sp)       # recupera o valor de x
		lw   t0, 0(sp)       # recupera o valor de r
		addi sp, sp, 16      # free na pilha
	
		addi t3, t3, 1   # p++
		blt  t5, zero, d_menor_que_zero  # if d < 0
	
		addi t4, t4, -1     # r = r-1
		sub  a1, t3, t4     # p-q
		slli a1, a1, 2      # 4*(p-q)
		addi a1, a1, 10     # 4*(p-q) + 10
		add  t5, t5, a1     # d = d + 4*(p-q) + 10
		jal  zero, continue # continua o loop
	
		d_menor_que_zero:
			slli a0, t3, 2   # 4*p
			add  t5, t5, a0  # d = d + 4*p
			addi t5, t5, 6   # d = d + 4*p
	
		continue:
			jal  zero, while     # volta pro inicio do loop	
	fim_while:		
		lw ra, 0(sp)   # recupera endereco de retorno
		addi sp, sp, 4 # free na pilha
		ret
	
draw_vine1:
	addi t6, zero, 320         # multplicador do eixo y
	la  t3, inicio_coordenadas # carrega endereco que contem o endereco do inicio das coordenadas
	lw  t3, 0(t3)              # (x,y) = (0,0)
	
	add t1, a0, a2             # x = x+p
	add t0, t3, t1             # (x,y) = (x+p,0)
	add t1, a1, a3             # y = y+q
	mul t1, t1, t6             # y *= 320
	add t0, t0, t1             # (x,y) = (x+p, y+q)
	sb  a4, 0(t0)              # desenha o pixel na tela
	
	addi a7, zero, 1
	add a0, zero, t0
	ecall
	
	addi a7, zero, 4
	la a0, virgula
	ecall
				
	ret	

draw_vine2:
	addi t6, zero, 320         # multplicador do eixo y
	la  t3, inicio_coordenadas # carrega endereco que contem o endereco do inicio das coordenadas
	lw  t3, 0(t3)              # (x,y) = (0,0)
	
	sub t1, a0, a2             # x = x-p
	add t0, t3, t1             # (x,y) = (x-p,0)
	add t1, a1, a3             # y = y+q
	mul t1, t1, t6             # y *= 320
	add t0, t0, t1             # (x,y) = (x-p, y+q)
	sb  a4, 0(t0)              # desenha o pixel na tela
	
	ret

exit:
	addi a7, zero, 10
	ecall
	
