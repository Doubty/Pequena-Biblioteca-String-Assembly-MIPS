#Ant�nio Galv�o dos santos Freitas - Ufersa -  Ci�ncia da computa��o - Implementa��o da fun��o strncpy.
#----------------------------------------
#  Fun��o STRNCPY
#----------------------------------------
.data

#----------------------------------------
#  Fun��o STRNCPY: declara��o de vari�veis
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
#  Fun��o STRNCPY: Inicio
#----------------------------------------

strncpy:
	add	$t0, $zero, $zero	# iniciado com 0
loop_cpy:	
	add	$t1, $t0, $a1		#endere�o de stringSource[i] em $t1
	lb	$t2, 0($t1)		# $t2 = stringsource[i]
	add	$t3, $t0, $a0		#endere�o de stringDestino[i] em $t3
	sb	$t2, 0($t3)		# stirngDestino[i] = stringSource[i]
	addi	$t0, $t0, 1		# i = i+1
	beq	$t0, $a2, return_cpy	#se i == count, vai para "return", senao, continua para a pr�xima instru��o
	j	loop_cpy			# vai para "loop"

return_cpy:	
	add 	$v0, $zero, $a0		#atribuindo o retorno(endereco de stringDestino)...
	jr	$ra			#retorna a fun��o principal
	
	
#----------------------------------------
#  Fun��o STRNCPY: Fim
#----------------------------------------
