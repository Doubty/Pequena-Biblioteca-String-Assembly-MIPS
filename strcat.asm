#Ant�nio Galv�o dos santos Freitas - Ufersa -  Ci�ncia da computa��o - Implementa��o da fun��o strcat.
#-----------------------------------------------
#	FUN��O STRCAT
#-----------------------------------------------

.data
 #-----------------------------------------------
#	FUN��O STRCAT: declara��o de vari�veis
#-----------------------------------------------

        mensagemSource: .asciiz "\n Digite a String Source: \n"
        mensagemDestino: .asciiz "\n Digite a String Destino: \n"
	resultado_cat: .asciiz 		"\nString Concatenada: "
	
	stringDestino: .asciiz		"aaaa aaa "
	stringSource: .asciiz		"bbb bbbbbbb"
			
.text

#-----------------------------------------------
#	FUN��O STRCAT: Inicio
#-----------------------------------------------



strcat:
	addi 	$sp, $sp, -4		#aloca espa�o para um word.
	sw	$ra, 0($sp) 		#Atribui $ra para a pilha $sp no espa�o alocado.
	
	#pegando o tamanho da stringDestino
	jal strlen_cat
	
	add	$t0, $v0, $zero		# i = $v0+0 // $vo = retorno do tamanho da stringDestino
	add	$t4, $zero, $zero	# y = 0+0	
	
loop_cat:	
	add	$t1, $t4, $a1		#endere�o de stringSource[y] em $t1
	lb	$t2, 0($t1)		# $t2 = stringSource[y]
	add	$t3, $t0, $a0		#endere�o de stringDestino[i] em $t3
	sb	$t2, 0($t3)		# stirngDestino[i] = stringSource[y]
	beq	$t2, $zero, return_cat	#se i == count, vai para "return"
	addi	$t4, $t4, 1		# y = y+1
	addi	$t0, $t0, 1		# i = i+1
	j	loop_cat			# vai para "loop"

return_cat:	
	add 	$v0, $zero, $a0		#atribuindo o retorno(endereco de stringDestino)...
	lw	$ra, 0($sp)		#retorna o valor $ra que estava na pilha
	addi	$sp, $sp, 4		#libera o espa�o que estava alocado.
	jr	$ra			#retorna a fun��o principal
	
#-----------------------------------------------------------------------------------------------------------	
	
strlen_cat:
	add $t0, $zero, $zero		# i = 0+0,  i = unsigned int
loopStrlen_cat:
	
	add $t1, $t0, $a0		#carrega o endereco de string[i] para $t1
	lb $t1, 0($t1)			#carrega o caractere correspondente ao endereco string[i] para $t1
	beq $t1, $zero, returnStrlen_cat	#caso o $t1 == 0, chama o return da fun��o
	addi $t0, $t0, 1		#i = i + 1
	j loopStrlen_cat			#retorna o loopStrlen
	
returnStrlen_cat:
        addi $t0, $t0, -1               # decrementado para tirar o \n colocado no final pelo input, sen�o aparecia a String quebrada
	addu $v0, $zero, $t0		#carrega o tamanho da string para a reg. de retorno($v0)
	jr $ra				#retorna a fun��o principal
	
#-----------------------------------------------
#	FUN��O STRCAT: Fim
#-----------------------------------------------
