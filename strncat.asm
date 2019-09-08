#Antônio Galvão dos santos Freitas - Ufersa -  Ciência da computação - Implementação da função strncat.
#-----------------------------------------------
#	FUNÇÃO STRNCAT:
#-----------------------------------------------

.data
 #-----------------------------------------------
#	FUNÇÃO STRNCAT: declaração de variáveis
#-----------------------------------------------

        mensagemSource_ncat: .asciiz "\n Digite a String Source: \n"
        mensagemDestino_ncat: .asciiz "\n Digite a String Destino: \n"
	resultado_ncat: .asciiz 		"\nString Concatenada: "
	  mensagemContador: .asciiz "\n Digite o número de caract que deve concatenar: "
	contador: .word 0
	stringDestino_ncat: .asciiz		"aaaa aaa "   # valor setado apenas para testar sem o input
	stringSource_ncat: .asciiz		"bbb bbbbbbb"  # Valor setado apenas para testar sem o input
			
.text

#-----------------------------------------------
#	FUNÇÃO STRCAT: Inicio
#-----------------------------------------------



strncat:
	addi 	$sp, $sp, -4		#aloca espaço para um word.
	sw	$ra, 0($sp) 		#Atribui $ra para a pilha $sp no espaço alocado.
	add	$t7, $zero, $zero	# zerando o registrador
	add $t7, $zero, $a2            # colocando o valor do contador 
	
	#pegando o tamanho da stringDestino
	jal strlen_ncat
	
	add	$t0, $v0, $zero		# i = $v0+0 // $vo = retorno do tamanho da stringDestino
	add	$t4, $zero, $zero	# y = 0+0 zerando o t4	
	
loop_ncat:	
	add	$t1, $t4, $a1		#endereço de stringSource[y] em $t1
	lb	$t2, 0($t1)		# $t2 = stringSource[y]
	add	$t3, $t0, $a0		#endereço de stringDestino[i] em $t3
	sb	$t2, 0($t3)		# stringDestino[i] = stringSource[y]
	beq	$t4, $t7, return_ncat	        #se i == count, vai para "return"
	addi	$t4, $t4, 1		# y = y+1
	addi	$t0, $t0, 1		# i = i+1
                                        # Colocando o limite de palavras para concatenar no final
	j	loop_ncat			# vai para "loop"

return_ncat:	
        sb	$zero, 0($t3)    # coloca o zero para finalizar a String => \0
	add 	$v0, $zero, $a0		#atribuindo o retorno(endereco de stringDestino)...
	lw	$ra, 0($sp)		#retorna o valor $ra que estava na pilha
	addi	$sp, $sp, 4		#libera o espaço que estava alocado.
	jr	$ra			#retorna a função principal
	
#-----------------------------------------------------------------------------------------------------------	
	
strlen_ncat:
	add $t0, $zero, $zero		# i = 0+0,  i = unsigned int
loopStrlen_ncat:
	
	add $t1, $t0, $a0		#carrega o endereco de string[i] para $t1
	lb $t1, 0($t1)			#carrega o caractere correspondente ao endereco string[i] para $t1
	beq $t1, $zero, returnStrlen_ncat	#caso o $t1 == 0, chama o return da função
	addi $t0, $t0, 1		#i = i + 1
	j loopStrlen_ncat			#retorna o loopStrlen
	
returnStrlen_ncat:
        addi $t0, $t0, -1               # decrementado para tirar o \n colocado no final pelo input, senão aparecia a String quebrada
	addu $v0, $zero, $t0		#carrega o tamanho da string para a reg. de retorno($v0)
	jr $ra				#retorna a função principal
	
#-----------------------------------------------
#	FUNÇÃO STRNCAT: Fim
#-----------------------------------------------
