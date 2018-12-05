.eqv blue 0xC7 # hitbot c7 para habilitar transparente C8 para azul
.eqv hair 0x1B # cabelo 0x1B original
.eqv skin 0x5B # pele   0x5B original
.eqv shrt 0x07 # camisa 0x6B original
.eqv pnts 0xC0 # calca  0x19 original

.globl render_standing, render_standing_reversed
.globl render_running1, render_running1_reversed
.globl render_running2, render_running2_reversed
.globl render_running3, render_running3_reversed
.globl render_running4, render_running4_reversed
.globl render_jump, render_jump_reversed
.globl render_background
.globl restore_background

.data
bitmap_begin: .word 0xFF000000
standing: .byte hair, hair, hair, hair, blue, blue, blue, blue,
				skin, skin, skin, skin, blue, blue, blue, blue,
				skin, skin, skin, skin, blue, blue, blue, blue,
				skin, skin, blue, blue, blue, blue, blue, blue,
				shrt, shrt, shrt, shrt, blue, blue, blue, blue,
				shrt, shrt, shrt, shrt, blue, blue, blue, blue,
				shrt, shrt, shrt, shrt, blue, blue, shrt, shrt,
				shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt,
				shrt, shrt, shrt, shrt, shrt, shrt, blue, blue,
				shrt, shrt, shrt, shrt, blue, blue, blue, blue,
				shrt, shrt, shrt, shrt, blue, blue, blue, blue,
				pnts, pnts, pnts, pnts, blue, blue, blue, blue,
				pnts, pnts, pnts, pnts, blue, blue, blue, blue,
				pnts, pnts, pnts, pnts, blue, blue, blue, blue,
				pnts, pnts, pnts, pnts, blue, blue, blue, blue,
				pnts, pnts, pnts, pnts, blue, blue, blue, blue,
				pnts, pnts, pnts, pnts, blue, blue, blue, blue,
				pnts, pnts, pnts, pnts, blue, blue, blue, blue,
				pnts, pnts, pnts, pnts, pnts, pnts, blue, blue,
				pnts, pnts, blue, blue, blue, blue, blue, blue,
				pnts, pnts, pnts, pnts, blue, blue, blue, blue

running1: .byte blue, blue, blue, blue, hair, hair, hair, hair, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, skin, skin, blue, blue, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, shrt, shrt, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, pnts, pnts, pnts, pnts, pnts, pnts, blue, blue, blue, blue, 
				blue, blue, blue, blue, pnts, pnts, blue, blue, pnts, pnts, blue, blue, blue, blue, 
				pnts, pnts, pnts, pnts, pnts, pnts, blue, blue, pnts, pnts, blue, blue, blue, blue, 
				pnts, pnts, blue, blue, blue, blue, blue, blue, pnts, pnts, blue, blue, blue, blue, 
				pnts, pnts, blue, blue, blue, blue, blue, blue, blue, blue, pnts, pnts, pnts, pnts, 
				blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, pnts, pnts, blue, blue
				
running2: .byte blue, blue, hair, hair, hair, hair, blue, blue, blue, blue, 
				blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, 
				blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, 
				blue, blue, skin, skin, blue, blue, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, 
				blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, 
				blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, 
				blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, 
				blue, blue, blue, blue, pnts, pnts, pnts, pnts, pnts, pnts, 
				blue, blue, blue, blue, pnts, pnts, blue, blue, pnts, pnts, 
				pnts, pnts, pnts, pnts, pnts, pnts, pnts, pnts, pnts, pnts, 
				pnts, pnts, blue, blue, pnts, pnts, blue, blue, blue, blue, 
				pnts, pnts, blue, blue, pnts, pnts, blue, blue, blue, blue, 
				blue, blue, blue, blue, pnts, pnts, blue, blue, blue, blue, 
				blue, blue, blue, blue, pnts, pnts, pnts, pnts, blue, blue

running3: .byte blue, blue, hair, hair, hair, hair, blue, blue, blue, blue, 
				blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, 
				blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, 
				blue, blue, skin, skin, blue, blue, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, 
				blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, 
				blue, blue, pnts, pnts, pnts, pnts, pnts, pnts, blue, blue, 
				blue, blue, pnts, pnts, pnts, pnts, pnts, pnts, blue, blue, 
				blue, blue, pnts, pnts, blue, blue, pnts, pnts, pnts, pnts, 
				pnts, pnts, pnts, pnts, blue, blue, blue, blue, pnts, pnts, 
				pnts, pnts, pnts, pnts, blue, blue, pnts, pnts, blue, blue, 
				pnts, pnts, blue, blue, blue, blue, pnts, pnts, blue, blue, 
				pnts, pnts, blue, blue, blue, blue, blue, blue, pnts, pnts, 
				pnts, pnts, blue, blue, blue, blue, blue, blue, blue, blue, 
				blue, blue, pnts, pnts, blue, blue, blue, blue, blue, blue

running4: .byte blue, blue, blue, blue, blue, blue, hair, hair, hair, hair, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, blue, blue, skin, skin, blue, blue, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, shrt, shrt, blue, blue, 
				blue, blue, blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, 
				blue, blue, blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
				blue, blue, blue, blue, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, blue, blue, 
				blue, blue, blue, blue, blue, blue, pnts, pnts, pnts, pnts, pnts, pnts, blue, blue, blue, blue, 
				blue, blue, blue, blue, blue, blue, pnts, pnts, pnts, pnts, pnts, pnts, blue, blue, blue, blue, 
				blue, blue, blue, blue, pnts, pnts, pnts, pnts, blue, blue, pnts, pnts, pnts, pnts, blue, blue, 
				blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, blue, blue, pnts, pnts, blue, blue, 
				blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, blue, blue, pnts, pnts, blue, blue, 
				pnts, pnts, pnts, pnts, blue, blue, blue, blue, blue, blue, blue, blue, pnts, pnts, pnts, pnts, 
				pnts, pnts, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, 
				pnts, pnts, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue, blue

jump: .byte blue, blue, blue, blue, blue, blue, hair, hair, hair, hair, blue, blue, blue, blue, blue, blue, 
			blue, blue, blue, blue, blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, blue, blue, 
			blue, blue, blue, blue, blue, blue, skin, skin, skin, skin, blue, blue, blue, blue, blue, blue, 
			blue, blue, blue, blue, blue, blue, skin, skin, blue, blue, blue, blue, blue, blue, blue, blue, 
			blue, blue, blue, blue, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
			blue, blue, blue, blue, blue, blue, shrt, shrt, shrt, shrt, blue, blue, shrt, shrt, blue, blue, 
			blue, blue, blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, 
			blue, blue, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, shrt, blue, blue, blue, blue, 
			blue, blue, shrt, shrt, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
			blue, blue, shrt, shrt, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
			blue, blue, blue, blue, blue, blue, shrt, shrt, shrt, shrt, blue, blue, blue, blue, blue, blue, 
			blue, blue, blue, blue, blue, blue, pnts, pnts, pnts, pnts, pnts, pnts, blue, blue, blue, blue, 
			blue, blue, blue, blue, blue, blue, pnts, pnts, pnts, pnts, pnts, pnts, pnts, pnts, blue, blue, 
			pnts, pnts, pnts, pnts, blue, blue, pnts, pnts, pnts, pnts, blue, blue, pnts, pnts, blue, blue, 
			blue, blue, pnts, pnts, pnts, pnts, pnts, pnts, blue, blue, blue, blue, pnts, pnts, blue, blue, 
			blue, blue, blue, blue, pnts, pnts, pnts, pnts, blue, blue, blue, blue, pnts, pnts, pnts, pnts

.text

# a0 = coordenada x
# a1 = coordenada y
render_background:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha

	la   a2, background # carrega o endereco da sprite standing
	addi a3, zero, 320  # w = 320
	addi a4, zero, 240  # h = 240
	addi a5, zero, 0    # renderizacao parcial = false
	addi a6, zero, 0    # nao flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
# Essa funcao restaura o valor do background antes de renderizar o proximo pitfall harry
restore_background:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha

	la   a2, background # carrega o endereco do background
	addi t0, zero, 320  # largura background
	mul  t1, t0, s1     # largura vezes y
	add  a2, a2, t1     # desloca a memoria em (largura * posicao do pitfall harry) vezes
	add  a2, a2, s0     # desloca o endereco de background em x
	
	add  a0, zero, s0 # x = posicao x do pitfall harry
	add  a1, zero, s1 # y = posicao y do pitfall harry
	addi a3, zero, 17 # largura = 17 (pior caso)
	addi a4, zero, 21 # altura = 21 (pior caso)
	addi a5, zero, 1  # renderizacao parcial = true
	addi a6, zero, 0  # nao flipa horizontalmente
	
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret

# a0 = coordenada x
# a1 = coordenada y
render_standing:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, 0  # valor da sprite atual = 0
	la   a2, standing # carrega o endereco da sprite standing
	addi a3, zero, 8  # w = 8
	addi a4, zero, 21 # h = 21
	addi a5, zero, 0  # renderizacao parcial = false
	addi a6, zero, 0  # nao flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
# a0 = coordenada x
# a1 = coordenada y
render_standing_reversed:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, 1000  # valor da sprite atual = 10000
	la   a2, standing    # carrega o endereco da sprite standing
	addi a3, zero, 8     # w = 8
	addi a4, zero, 21    # h = 21
	addi a5, zero, 0     # renderizacao parcial = false
	addi a6, zero, 1     # flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
# a0 = coordenada x
# a1 = coordenada y
render_running1:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha

	addi s2, zero, 1  # valor da sprite atual = 1	
	la   a2, running1 # carrega o endereco da sprite running1
	addi a3, zero, 14 # w = 14
	addi a4, zero, 20 # h = 20
	addi a5, zero, 0  # renderizacao parcial = false
	addi a6, zero, 0  # nao flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
# a0 = coordenada x
# a1 = coordenada y
render_running1_reversed:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha

	addi s2, zero, -1  # valor da sprite atual = -1	
	la   a2, running1 # carrega o endereco da sprite running1
	addi a3, zero, 14 # w = 14
	addi a4, zero, 20 # h = 20
	addi a5, zero, 0  # renderizacao parcial = false
	addi a6, zero, 1  # flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret

# a0 = coordenada x
# a1 = coordenada y	
render_running2:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, 2  # valor da sprite atual = 2
	la   a2, running2 # carrega o endereco da sprite running2
	addi a3, zero, 10 # w = 10
	addi a4, zero, 21 # h = 21
	addi a5, zero, 0  # renderizacao parcial = false	
	addi a6, zero, 0  # nao flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
# a0 = coordenada x
# a1 = coordenada y	
render_running2_reversed:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, -2  # valor da sprite atual = -2
	la   a2, running2 # carrega o endereco da sprite running2
	addi a3, zero, 10 # w = 10
	addi a4, zero, 21 # h = 21
	addi a5, zero, 0  # renderizacao parcial = false	
	addi a6, zero, 1  # flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret

# a0 = coordenada x
# a1 = coordenada y	
render_running3:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, 3  # valor da sprite atual = 3
	la   a2, running3 # carrega o endereco da sprite running3
	addi a3, zero, 10 # w = 10
	addi a4, zero, 21 # h = 21
	addi a5, zero, 0  # renderizacao parcial = false
	addi a6, zero, 0  # nao flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
render_running3_reversed:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, -3  # valor da sprite atual = -3
	la   a2, running3 # carrega o endereco da sprite running3
	addi a3, zero, 10 # w = 10
	addi a4, zero, 21 # h = 21
	addi a5, zero, 0  # renderizacao parcial = false
	addi a6, zero, 1  # flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
# a0 = coordenada x
# a1 = coordenada y	
render_running4:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, 4  # valor da sprite atual = 4
	la   a2, running4 # carrega o endereco da sprite running4
	addi a3, zero, 16 # w = 16
	addi a4, zero, 20 # h = 20
	addi a5, zero, 0  # renderizacao parcial = false
	addi a6, zero, 0  # nao flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
render_running4_reversed:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, -4  # valor da sprite atual = -4
	la   a2, running4 # carrega o endereco da sprite running4
	addi a3, zero, 16 # w = 16
	addi a4, zero, 20 # h = 20
	addi a5, zero, 0  # renderizacao parcial = false
	addi a6, zero, 1  # flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
# a0 = coordenada x
# a1 = coordenada y	
render_jump:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, 5  # valor da sprite atual = 5
	la   a2, jump     # carrega o endereco da sprite jump
	addi a3, zero, 16 # w = 16
	addi a4, zero, 16 # h = 16
	addi a5, zero, 0  # renderizacao parcial = false
	addi a6, zero, 0  # nao flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
render_jump_reversed:
	addi sp, sp, -4 # aloca 1 espaco na pilha
	sw   ra, 0(sp)  # guarda o valor de ra na pilha
	
	addi s2, zero, -5  # valor da sprite atual = -5
	la   a2, jump     # carrega o endereco da sprite jump
	addi a3, zero, 16 # w = 16
	addi a4, zero, 16 # h = 16
	addi a5, zero, 0  # renderizacao parcial = false
	addi a6, zero, 1  # flipa horizontalmente
	call renderSprite
	
	lw   ra, 0(sp) # restaura o valor de ra
	addi sp, sp 4  # desaloca 1 espaco na pilha
	
	ret
	
# Essa funcao renderiza uma sprite na tela, dado endereco da sprite, largura, altura e coordenadas (x,y)
# a0 = coordenada x do bitmap display onde comeca a renderizacao
# a1 = coordenada y do bitmap display onde comeca a renderizacao
# a2 = endereco da sprite
# a3 = largura da sprite
# a4 = altura da sprite
# a5 = renderziacao parcial
# a6 = flip sprite horizontalmente
renderSprite:
	li   t0, 0xFF000000  # carrega o endereco inicial do bitmap display
	addi t1, zero, 320   # largura do bitmap display
	mul  t2, t1, a1      # bmp display vezes coordenada y
	add  t0, t0, a0      # desloca a memoria em x bytes para a direita
	add  t0, t0, t2	     # desloca a memoria em y bytes para baixo

	mul t2, a3, a4   # nro de pixels = largura x altura
	add t3, zero, a3 # contador de largura = largura
	sub t1, t1, a3   # valor para pular para a proxima linha = 320 - largura
	addi t1, t1, 1  # valor da proxima linha+1
	
	beq a6, zero, loop_render # renderiza normal
	add t0, t0, a3 # x inicial passa a ser x + largura
		
	loop_render: beq t2, zero, loop_render_end # while (nro de pixels > 0)
		lb t4, 0(a2) # carrega um pixel da sprite
		sb t4, 0(t0) # carrega o pixel no bitmap display
			
		addi a2, a2, 1   # proximo pixel
		addi t3, t3, -1          # decrementa o contador de largura
		beq  t3, zero, next_line # if contador de largura == 0
		
		addi t0, t0, 1     # desloca o endereco do bmp display em 1 byte
		jal zero, continue # prepara para o proximo loop
		next_line:
			add t3, zero, a3 # restaura o valor da largura
			add t0, t0, t1   # endereco do bmp display += 320+1 - largura
			
			beq a6, zero, next_line_no_flip
			add t0, t0, a3
			add t0, t0, a3
			
next_line_no_flip: 
			bne a5, zero, partial_render
			jal zero, continue
			
			partial_render:
				add a2, a2, t1 # alem de deslocar no bitmap display, desloca na memoria
				addi a2, a2, -1
			
		continue:
			addi t2, t2, -1 # diminui o contador de pixels
			
			beq a6, zero, loop_render # continua o loop
			addi t0, t0, -2 # decrementa -2 por vai ser somado +1 na linha seguinte
			
			jal zero, loop_render
	loop_render_end:
	ret # retorna
	
