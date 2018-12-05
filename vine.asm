.eqv azul 0xC0

.data
# x vai de [207,151] direita -> esquerda
# x vai de [151,95] direita -> esquerda

# y esta no sentido baixo -> cima
y: .word  140,140,140,140,140,140,140,140,140,139,139,139,139,139,139,138,138,138,138,137,137,
		  137,137,136,136,136,135,135,135,134,134,133,133,132,132,131,131,130,130,129,129,128,127,
		  127,126,125,125,124,123,122,121,121,120,119,118,117,116

inicio_coordenadas: .word 0xFF000000

.text
draw_vine:
	addi a0, zero, 151   # x0 centro = 151
	addi a1, zero, 60    # y0 centro = 60
	addi a2, zero, 207   # x1 = 207 (ponto mais a direita)
	addi a3, zero, 116   # y1 = 116 (ponto mais alto)
	addi a4, zero, azul  # cor = azul
	call plot_line
	
	addi a0, zero, 151   # x0 centro = 151
	addi a1, zero, 60    # y0 centro = 60
	addi a2, zero, 95    # x1 = 95 (ponto mais a esquerda)
	addi a3, zero, 116   # y1 = 116 (ponto mais alto)
	addi a4, zero, azul  # cor = azul
	call plot_line
	
	addi a0, zero, 151   # x0 centro = 151
	addi a1, zero, 60    # y0 centro = 60
	addi a2, zero, 151   # x1 = 151 (meio da curva)
	addi a3, zero, 140   # y1 = 140 (ponto mais baixo)
	addi a4, zero, azul  # cor = azul
	call plot_line
	
	addi a0, zero, 151   # x0 centro = 151
	addi a1, zero, 60    # y0 centro = 60
	addi a2, zero, 198   # x1 = 151 (meio da curva)
	addi a3, zero, 124   # y1 = 140 (ponto mais baixo)
	addi a4, zero, azul  # cor = azul
	call plot_line
	
	jal zero, exit
	

# a0 = x0
# a1 = y0
# a2 = x1
# a3 = y1
# a4 = cor1
# a5 = cor2
plot_line: 
	sub t0, a2, a0     # dx = (x1 - x0)
    add t2, zero, t0   # copia x
    slt t3, t0, zero   # (x1-x0) < 0?
    beq t3, zero, verify_y
    sub t0, zero, t2   # x = 0 - x		
verify_y:
	sub t1, a3, a1     # dy = (y1 - y0)
	add t2, zero, t1   # copia y
	slt t3, t1, zero   # (y1-y0) < 0?
	beq t3, zero, continue_plot_line
	sub t1, zero, t2   # y = 0 - y
continue_plot_line:
	bgt t1, t0, continue_plot_line2 # if abs(y1-y0) > abs(x1-x0)
	ble a0, a2, plot_line_low  # if x0 <= x1
	
	add t4, zero, a0
	add a0, zero, a2 # a0 = x1
	add a2, zero, t4 # a2 = x0
	add t4, zero, a1
	add a1, zero, a3 # a1 = y1
	add a3, zero, t4 # a3 = y0
	jal zero, plot_line_low    # chamada do metodo com coordenadas invertidas	
	
continue_plot_line2:
	ble a1, a3, plot_line_high # if y0 <= y1
	add t4, zero, a0
	add a0, zero, a2 # a0 = x1
	add a2, zero, t4 # a2 = x0
	add t4, zero, a1
	add a1, zero, a3 # a1 = y1
	add a3, zero, t4 # a3 = y0
	jal zero, plot_line_high    # chamada do metodo com coordenadas invertidas
	
# a0 = x0
# a1 = y0
# a2 = x1
# a3 = y1
# a4 = cor1
# a5 = cor2
plot_line_high:sub t0, a2, a0    # dx = (x1 - x0)
			   sub t1, a3, a1    # dy = (y1 - y0)
			   addi t2, zero, 1  # xi = 1
			   bge t0, zero, continue_plot_line_high # dx >= 0?
			   addi t2, zero, -1 # xi = -1
			   sub t0, zero, t0  # dx = -dx
continue_plot_line_high:
			   addi t3, t3, 2    # d = 2
			   mul  t3, t3, t0   # d = 2*dx
			   sub  t3, t3, t1   # d = 2dx - dy
			   add  t4, zero, a0 # x = x0
			   
	loop_high:bgt a1, a3, fim_loop_high   # y vai de y0 ate y1
		  	  addi t6, zero, 320         # multitplicador do eixo y
		  	  la  t5, inicio_coordenadas
		      lw  t5, 0(t5)              # carrega endereco inicial do bitmap display
		      add t5, t5, t4             # (x, 0)
		      mul t6, t6, a1             # calculando y do bmp display
		      add t5, t5, t6             # (x,y)
		      sb  a4, 0(t5)              # plot(x,y)
		  
		      ble t3, zero, continue_loop_high # if d <= 0
		      add  t4, t4, t2 # x = x + xi
		      addi a6, zero, 2 # 2
		      mul  a6, a6, t1  # 2*dy
		      sub  t3, t3, a6  # d = d-2*dy		  
    continue_loop_high:
		      addi a6, zero, 2 # 2
		      mul  a6, a6, t0  # 2*dx
		      add  t3, t3, a6  # d = d+2*dx
		      
		      addi a1, a1, 1   # y = y + 1
		      jal zero, loop_high
    fim_loop_high: ret
    
    
 plot_line_low: sub t0, a2, a0    # dx = (x1 - x0)
			   sub t1, a3, a1    # dy = (y1 - y0)
			   addi t2, zero, 1  # yi = 1
			   bge t1, zero, continue_plot_line_low # dy >= 0?
			   addi t2, zero, -1 # yi = -1
			   sub t1, zero, t1  # dy = -dy
continue_plot_line_low:
			   addi t3, t3, 2    # d = 2
			   mul  t3, t3, t1   # d = 2*y
			   sub  t3, t3, t0   # d = 2y - dx
			   add  t4, zero, a1 # y = y0
			   
	loop_low: bgt a0, a2, fim_loop_low   # x vai de x0 ate x1
		  	  addi t6, zero, 320         # multitplicador do eixo y
		  	  la  t5, inicio_coordenadas
		      lw  t5, 0(t5)              # carrega endereco inicial do bitmap display
		      add t5, t5, a0             # (x, 0)
		      mul t6, t6, t4             # calculando y do bmp display
		      add t5, t5, t6             # (x,y)
		      sb  a4, 0(t5)              # plot(x,y)
		  
		      ble t3, zero, continue_loop_low # if d <= 0
		      add  t4, t4, t2 # y = y + yi
		      addi a6, zero, 2 # 2
		      mul  a6, a6, t0  # 2*dx
		      sub  t3, t3, a6  # d = d-2*dx		  
    continue_loop_low:
		      addi a6, zero, 2 # 2
		      mul  a6, a6, t1  # 2*dy
		      add  t3, t3, a6  # d = d+2*dy
		      
		      addi a0, a0, 1   # x = x + 1
		      jal zero, loop_low
    fim_loop_low: ret
		 
		  
		  
		  
			   
#draw_line:	sub t0, a2, a0     # dx = (x1 - x0)
#	        ori t2, zero, t0   # copia x
#		    slt t3, t0, zero   # (x1-x0) < 0?
#		    beq t3, zero, verify_y
#			sub t0, zero, t2   # x = 0 - x
			
#verify_y: sub t1, a3, a1     # dy = (y1 - y0)
#	      ori t2, zero, t1   # copia y
#		  slt t3, t1, zero   # (y1-y0) < 0?
#		  beq t3, zero, err
#		  sub t1, zero, t2   # y = 0 - y

exit:
		  
	
