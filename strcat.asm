#Antônio Galvão dos santos Freitas - Ufersa -  Ciência da computação - Implementação da função strcat.
#-----------------------------------------------
#	FUNÇÃO STRCAT
#-----------------------------------------------

.data
 #-----------------------------------------------
#	FUNÇÃO STRCAT: declaração de variáveis
#-----------------------------------------------

        mensagemSource: .asciiz "\n Digite a String Source: \n"
        mensagemDestino: .asciiz "\n Digite a String Destino: \n"
	resultado_cat: .asciiz 		"\nString Concatenada: "
	
	stringDestino: .asciiz		"aaaa aaa "
	stringSource: .asciiz		"bbb bbbbbbb"
			
.text

#-----------------------------------------------
#	FUNÇÃO STRCAT: Inicio
#-----------------------------------------------



strcat:
	addi 	$sp, $sp, -4		#aloca espaço para um word.
	sw	$ra, 0($sp) 		#Atribui $ra para a pilha $sp no espaço alocado.
	
	#pegando o tamanho da stringDestino
	jal strlen_cat
	
	add	$t0, $v0, $zero		# i = $v0+0 // $vo = retorno do tamanho da stringDestino
	add	$t4, $zero, $zero	# y = 0+0	
	
loop_cat:	
	add	$t1, $t4, $a1		#endereço de stringSource[y] em $t1
	lb	$t2, 0($t1)		# $t2 = stringSource[y]
	add	$t3, $t0, $a0		#endereço de stringDestino[i] em $t3
	sb	$t2, 0($t3)		# stirngDestino[i] = stringSource[y]
	beq	$t2, $zero, return_cat	#se i == count, vai para "return"
	addi	$t4, $t4, 1		# y = y+1
	addi	$t0, $t0, 1		# i = i+1
	j	loop_cat			# vai para "loop"

return_cat:	
	add 	$v0, $zero, $a0		#atribuindo o retorno(endereco de stringDestino)...
	lw	$ra, 0($sp)		#retorna o valor $ra que estava na pilha
	addi	$sp, $sp, 4		#libera o espaço que estava alocado.
	jr	$ra			#retorna a função principal
	
#-----------------------------------------------------------------------------------------------------------	
	
strlen_cat:
	add $t0, $zero, $zero		# i = 0+0,  i = unsigned int
loopStrlen_cat:
	
	add $t1, $t0, $a0		#carrega o endereco de string[i] para $t1
	lb $t1, 0($t1)			#carrega o caractere correspondente ao endereco string[i] para $t1
	beq $t1, $zero, returnStrlen_cat	#caso o $t1 == 0, chama o return da função
	addi $t0, $t0, 1		#i = i + 1
	j loopStrlen_cat			#retorna o loopStrlen
	
returnStrlen_cat:
        addi $t0, $t0, -1               # decrementado para tirar o \n colocado no final pelo input, senão aparecia a String quebrada
	addu $v0, $zero, $t0		#carrega o tamanho da string para a reg. de retorno($v0)
	jr $ra				#retorna a função principal
	
#-----------------------------------------------
#	FUNÇÃO STRCAT: Fim
#-----------------------------------------------
