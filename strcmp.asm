#Ant�nio Galv�o dos santos Freitas - Ufersa -  Ci�ncia da computa��o - Implementa��o da fun��o strcmp.
#-----------------------------------------------
#	FUN��O STRCMP
#-----------------------------------------------

.data

#-----------------------------------------------
#	FUN��O STRCMP: declara��o de vari�veis
#-----------------------------------------------
	aviso: .asciiz	"\n RESULTADO DA VERIFICA��O: \n"
	mensagemLeitura1: .asciiz "\nDigite a primeira String: \n"
	mensagemLeitura2: .asciiz "\nDigite a segunda String: \n"
	primeira: .asciiz	"\n\nString 1: "
	segunda: .asciiz	"\nString 2: "
	
	retorno: .asciiz	"\nRETORNO: "
	
	string1: .asciiz	"EXEMPLr"
	string2: .asciiz	"EXEMPL"	
	
.text

#-----------------------------------------------
#	FUN��O STRCMP: Inicio
#-----------------------------------------------
     

strcmp:
	guardandoValores:

		addi  	$sp, $sp, -4	#aloca espa�o para um word
		sw	$ra, 0($sp)	#carrega o $ra na pilha

	#verifica se as strings tem o mesmo tamanho
	verificacao:

		#chamando strlen para a primeira string
		add	$a2, $zero, $a0		#atribui o endereco da primeira string para o parametro de chamada do strlen
		jal	strlen_cmp		#chama a fun��o
		add	$t5, $zero, $v0		#atribui meu retorno de tamanho da primeira string para $t0 
	
		#chamando strlen para a segunda string
		add	$a2, $zero, $a1		#atribui o endereco da segunda string para o parametro de chamada do strlen
		jal	strlen_cmp			#chamada a fun��o
		add	$t6, $zero, $v0		#atribui meu retorno de tamanho da segunda string para $t1
	
		bne	$t5, $t6, casoDiferente		#caso os tamanhos sejam diferentes, chama o casoDiferente
		
		add	$t2, $zero, $zero		# i = 0+0
		
		casoIgual:
			
			add	$t2, $t2, $a0		#carrega endereco string0[i]
			lb	$t3, 0($t2)		#pega o caractere do endere�o string0[i]
			sub	$t2, $t2, $a0		#retira o endereco da primeira string
			add	$t2, $t2, $a1		#carrega o endereco string1[i]
			lb	$t4, 0($t2)		#pega o caractere do endere�o string1[i]
			sub	$t2, $t2, $a1		#retira o endere�o da segunda string
			addi	$t2, $t2, 1		# i = i + 1
			beq	$t3, $zero, verificarIdenticas		#caso tenha chegado no final da primeira string, chama verificarIdenticas
			beq	$t3, $t4, casoIgual			#verifica se os dois caracteres s�o iguais.
			j	naoIdenticas				#chama "naoIdenticas"
			
			verificarIdenticas:
				bne	$t4, $zero, naoIdenticas	#Verifica se $t4 == 0, pois chegou aqui poquer o $t3 == 0.
				li	$v0, 0				#caso a palavra de cima seja falsa, ent�o as strings s�o identicas.
				j	exit				#chama a saida da fun��o.
			naoIdenticas:
				li	$v0, 2				#atribui $v0 = -1, pois as strings n�o s�o identicas...
				j	exit				#chama a saida da fun��o
		
		casoDiferente:
			slt	$t2, $t5, $t6		#Verifica se primeira String < segunda string
			beq	$t2, 1, string0Menor	#caso $t2 == 1, ent�o chamo minha label string0Menor 
			
			li	$v0, 1		#meu retorno sera positivo, pois minha primeira string � maior que a segunda.
			j	exit		#chama a saida da fun��o
			
			#Caso entre  aqui, minha primeira string � menor que a segunda
			string0Menor:
				li	$v0, -1		#meu retorno ser� negativo.
				j	exit		#chamo minha saida de fun��o
		
	#Saida da fun��o strcmp	
	exit:	
		lw	$ra, 0($sp)		#carrega meu $ra, que estava na pilha
		addi	$sp, $sp, 4		#restaura a pilha
		jr	$ra			#retorna para principal
#-----------------------------------------------------------------------------------------------------------	
	
strlen_cmp:
	add $t0, $zero, $zero		# i = 0+0,  i = unsigned int
loopStrlen:
	
	add $t1, $t0, $a2		#carrega o endereco de string[i] para $t1
	lb $t1, 0($t1)			#carrega o caractere correspondente ao endereco string[i] para $t1
	beq $t1, $zero, returnStrlen	#caso o $t1 == 0, chama o return da fun��o
	addi $t0, $t0, 1		#i = i + 1
	j loopStrlen			#retorna o loopStrlen
	
returnStrlen:
	addu $v0, $zero, $t0		#carrega o tamanho da string para a reg. de retorno($v0)
	jr $ra				#retorna a fun��o principal
	
#-----------------------------------------------
#	FUN��O STRCMP: Fim
#-----------------------------------------------
