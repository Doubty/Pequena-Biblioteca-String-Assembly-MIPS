#Ant�nio Galv�o dos santos Freitas - Ufersa -  Ci�ncia da computa��o - Implementa��o da fun��o strlen.
#----------------------------------------
#  Fun��o STRLEN
#----------------------------------------

.data
	
#----------------------------------------
#  Fun��o STRLEN: declara��es de vari�veis
#----------------------------------------
	mensagemString: .asciiz "\nDigite a String:\n"
	cabecalho: .asciiz	" \n"
	resultado: .asciiz 	"\nTamanho da string: "
	
	string: .asciiz	
	
	tamString: .word 0	
	
.text

#----------------------------------------
#  Fun��o STRLEN: inicio
#----------------------------------------
   
      
strlen:
	add $t0, $zero, $zero		# i = 0+0,  i = unsigned int
loop:	
	add $t1, $t0, $a0		#carrega o endereco de string[i] para $t1
	lb $t1, 0($t1)			#carrega o caractere correspondente ao endereco string[i] para $t1
	beq $t1, $zero, return		#caso o $t1 == 0, chama o return da fun��o
	addi $t0, $t0, 1		#i = i + 1
	j loop
return:
	addu $v0, $zero, $t0		#carrega o tamanho da string para a reg. de retorno($v0)
	jr $ra				#retorna a fun��o principal
	
#----------------------------------------
#  Fun��o STRLEN: Fim
#----------------------------------------
