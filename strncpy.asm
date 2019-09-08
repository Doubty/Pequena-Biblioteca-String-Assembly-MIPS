#Antônio Galvão dos santos Freitas - Ufersa -  Ciência da computação - Implementação da função strncpy.
#----------------------------------------
#  Função STRNCPY
#----------------------------------------
.data

#----------------------------------------
#  Função STRNCPY: declaração de variáveis
#----------------------------------------
        leituraString: .asciiz "\n Digite a origin: \n"
        leituraCount: .asciiz "\n Digite a qtd de caracteres: \n"
	aviso_1: .asciiz 	"\nINICIO STRNCPY:\n"
	aviso_2: .asciiz 	"\n\n FIM STRNCPY\n"
	msg_1: .asciiz 	"String 1: "
	msg_2: .asciiz 	"String 2: "
	
	stringSource_cpy: .asciiz 	"TESTE_STRING\n"
	
	stringDestino_cpy: .asciiz	
	
	count: .word 	4 
	 
.text

#----------------------------------------
#  Função STRNCPY: Inicio
#----------------------------------------

strncpy:
	add	$t0, $zero, $zero	# iniciado com 0
loop_cpy:	
	add	$t1, $t0, $a1		#endereço de stringSource[i] em $t1
	lb	$t2, 0($t1)		# $t2 = stringsource[i]
	add	$t3, $t0, $a0		#endereço de stringDestino[i] em $t3
	sb	$t2, 0($t3)		# stirngDestino[i] = stringSource[i]
	addi	$t0, $t0, 1		# i = i+1
	beq	$t0, $a2, return_cpy	#se i == count, vai para "return", senao, continua para a próxima instrução
	j	loop_cpy			# vai para "loop"

return_cpy:	
	add 	$v0, $zero, $a0		#atribuindo o retorno(endereco de stringDestino)...
	jr	$ra			#retorna a função principal
	
	
#----------------------------------------
#  Função STRNCPY: Fim
#----------------------------------------
