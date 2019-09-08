#Ant�nio Galv�o dos santos Freitas - Ufersa -  Ci�ncia da computa��o - Implementa��o das fun��es para manipula��o de Strings.
.data
	msgmain1: .asciiz " \n Escolha uma das op��es abaixo:\n1 - strlen\n2 - strcmp\n3 - strcat\n4 - strncat\n5 - strncpy\n0 - Sair"
	
.text
.globl main #define o main como um label global	
	main: 
	
		la $a0, msgmain1 #passa o endere�o da mensagem inicial para $a0
		li $v0, 4    #passa o c�digo do call para mostrar a mensagem
		syscall      #executa a diretiva que mostra a mensagem
	
		li $v0, 5    #passa o c�digo do call para ler um inteiro
		syscall	     #executa a diretiva para ler um inteiro, a resposta fica em $v0
		
		beq $v0, 1, chamada_strlen #testa as op��es para executar os m�todos que o usu�rio escolher
		beq $v0, 2, chamada_strcmp 
		beq $v0, 3, chamada_strcat
		beq $v0, 4, chamada_strncat
		beq $v0, 5, chamada_strncpy
		beq $v0, 0, exitmain
	
		j main #se n�o for escolhida nenhuma op��o, retorna para o main
	
	chamada_strlen:
			
		  #mensagem para leitura de String
          la $a0, mensagemString  #Passando o endere�o da String
          li $v0, 4               #especificando a fun��o de printar string para o syscall
          syscall                 #chamando o syscall
              
         #lendo a String
         la $a0, string   #Passando o endere�o da String
         li $a1, 25       #numero de caracteres maximo
         li $v0, 8        # espeficando a fun��o de ler string para o syscall
         syscall          #chamando o syscall
         
	#carregando os endere�os
	la $s0, string		#endereco da "string" para $s0
	la $s1, tamString	#enderedo do "tamString" para $s1
	
	#passando o parametro da fun��o
	add $a0, $zero, $s0	#passa o endereco da "string"
	
	#chamando a fun��o strlen
	jal strlen
	
	#-------------------------------------------------
	
	sw $v0, 0($s1)		#atribui o valor de retorno da fun��o ao "tamString"
	
	#-------------------------------
	#	mostrando o resultado
	#-------------------------------
	
			#chamada do sistema(imprime)
	
	la $a0, resultado	#carrega o endereco de "resultado"
	li $v0, 4		#informa que � uma string a ser inpressa...
	syscall			#chamada do sistema(imprime)
	
	
	lw $a0, 0($s1)		#carrega o valor de "tamString" para $a0
	addi $a0, $a0, -1       # decremento para tirar o \n, porque estava aparecendo +1 depois que eu coloquei para ler do input
	li $v0, 1		#informa que � um inteiro a ser inpresso...
	syscall			#chamada do sistema(imprime)
	
	la $a0, cabecalho	#t� usando pra fazer quebra de linha
	li $v0, 4		#informa que � uma string a ser inpressa...
	syscall			#chamada do sistema(imprime)
	
		
		j main		#retorna para o main ao fim da execu��o
		
		
	
	chamada_strcmp:
	
	   #mensagem de leitura e lendo as Strings
        
             #mensagem para leitura de String
          la $a0, mensagemLeitura1  #Passando o endere�o da String
          li $v0, 4               #especificando a fun��o de printar string para o syscall
          syscall                 #chamando o syscall
              
         #lendo a String
         la $a0, string1   #Passando o endere�o da String
         li $a1, 25       #numero de caracteres maximo
         li $v0, 8        # espeficando a fun��o de ler string para o syscall
         syscall          #chamando o syscall
   
   
    #mensagem para leitura de String
          la $a0, mensagemLeitura2  #Passando o endere�o da String
          li $v0, 4               #especificando a fun��o de printar string para o syscall
          syscall                 #chamando o syscall
              
         #lendo a String
         la $a0, string2   #Passando o endere�o da String
         li $a1, 25       #numero de caracteres maximo
         li $v0, 8        # espeficando a fun��o de ler string para o syscall
         syscall          #chamando o syscall
   
	#carregando as variaveis
	la	$s0, string1	#carrega o endereco de "string0"
	la	$s1, string2	#carrega o endereco de "string1"

	#paramentros da fun��o
	add	$a0, $zero, $s0		#passa endereco de "string0" para $a0
	add	$a1, $zero, $s1		#passao endereco de "string1" para $a1
	
	#chamada da fun��o strcmp
	jal strcmp
	
	add	$s2, $v0, $zero		#atribui a $s2 o valor de retorno da fun��o strcmp
	
	
	#------------------------------------------
	#	Mostrando Resultado
	#------------------------------------------
	
	la	$a0, aviso		
	li	$v0, 4
	syscall
	
	la	$a0, primeira
	li	$v0, 4
	syscall
	
	la	$a0, string1		#carrega o endereco da string primeira
	li	$v0, 4			#passa o parametro de imprimir string para $v0
	syscall				#chamada do sistema
	
	la	$a0, segunda
	li	$v0, 4
	syscall
	
	la	$a0, string2		#carrega o endereco da string segunda
	li	$v0, 4			#passa o parametro de imprimir string para $v0
	syscall				#chamada do sistema
	
	la	$a0, retorno		#carrega o endereco do retorno da fun��o strcmp
	li	$v0, 4			#passa o parametro de imprimir inteiro para $v0
	syscall				#chamada do sistema
	
	add	$a0, $zero, $s2		#carrega o endereco do retorno da fun��o strcmp	
	li	$v0, 1			#passa o parametro de imprimir inteiro para $v0
	syscall				#chamada do sistema
	
		j main		#retorna para o main ao fim da execu��o	
		
	chamada_strcat: 
	
	 #mensagem de leitura e lendo as Strings
        
             #mensagem para leitura de String
          la $a0, mensagemSource  #Passando o endere�o da String
          li $v0, 4               #especificando a fun��o de printar string para o syscall
          syscall                 #chamando o syscall
              
         #lendo a StringSource
         la $a0, stringSource   #Passando o endere�o da String
         li $a1, 25       #numero de caracteres maximo
         li $v0, 8        # espeficando a fun��o de ler string para o syscall
         syscall          #chamando o syscall
   
   
    #mensagem para leitura de String
          la $a0, mensagemDestino  #Passando o endere�o da String
          li $v0, 4               #especificando a fun��o de printar string para o syscall
          syscall                 #chamando o syscall
              
         #lendo a String
         la $a0, stringDestino   #Passando o endere�o da String
         li $a1, 25       #numero de caracteres maximo
         li $v0, 8        # espeficando a fun��o de ler string para o syscall
         syscall          #chamando o syscall

	#carregando os endere�os
	la $s0, stringDestino		#endereco da "stringDestino" para $s0
	la $s1, stringSource		#enderedo do "stringSource" para $s1
	
	#passando o parametro da fun��o
	add $a0, $zero, $s0		#passa o endereco da "stringDestino"
	add $a1, $zero, $s1		#passa o endereco da "stringSource"
	
	#chamando a fun��o strcat
	jal strcat			#Retorna o endereco de stringDestino, no caso, n�o precisa ser utilizado...

	#-------------------------------
	#	mostrando o resultado
	#-------------------------------
	
	la	$a0, resultado_cat			#carrega o endereco de "resultado"
	li	$v0, 4				# especifica o servido de impressao para string
	syscall					# imprime
	
	la   	$a0, stringDestino		#carrega o endereco de "stringDestino"
      	li   	$v0, 4           		# especifica o servido de impressao para string
      	syscall               			# imprime 

#---------------------------------------------------------------------------------------------

	      j main		#retorna para o main ao fim da execu��o								
		
	chamada_strncat: 
	
	 #mensagem de leitura e lendo as Strings
        
             #mensagem para leitura de String
          la $a0,  mensagemSource_ncat  #Passando o endere�o da String
          li $v0, 4               #especificando a fun��o de printar string para o syscall
          syscall                 #chamando o syscall
              
         #lendo a StringSource
         la $a0, stringSource_ncat   #Passando o endere�o da String
         li $a1, 25       #numero de caracteres maximo
         li $v0, 8        # espeficando a fun��o de ler string para o syscall
         syscall          #chamando o syscall
   
   
    #mensagem para leitura de String
          la $a0,  mensagemDestino_ncat  #Passando o endere�o da String
          li $v0, 4               #especificando a fun��o de printar string para o syscall
          syscall                 #chamando o syscall
              
         #lendo a String
         la $a0, stringDestino_ncat   #Passando o endere�o da String
         li $a1, 25       #numero de caracteres maximo
         li $v0, 8        # espeficando a fun��o de ler string para o syscall
         syscall          #chamando o syscall
         
         #mensagem para leitura do contador
      la $a0, mensagemContador  #Passando o endere
      li $v0, 4               #especificando a fun��o
      syscall                 #chamando o syscall
      
      # Lendo o contador
     li $v0, 5    #especificando a fun��o
     syscall       #chamando o syscall
     
     la $t0, contador   #pegando o endere�o de contador
     sw $v0, 0($t0)     #armazenando o valor lido do input em contador
     

	#carregando os endere�os
	la $s0, stringDestino_ncat		#endereco da "stringDestino" para $s0
	la $s1, stringSource_ncat		#enderedo do "stringSource" para $s1
	la $s2, contador                #endere�o do contador para $s2
	
	#passando o parametro da fun��o
	add $a0, $zero, $s0		#passa o endereco da "stringDestino"
	add $a1, $zero, $s1		#passa o endereco da "stringSource"
	lw $a2, 0($s2)                  #passa o valor de contador para o parametro
	
	#chamando a fun��o strcat
	jal strncat			#Retorna o endereco de stringDestino, no caso, n�o precisa ser utilizado...

	#-------------------------------
	#	mostrando o resultado
	#-------------------------------
	
	la	$a0, resultado_ncat			#carrega o endereco de "resultado"
	li	$v0, 4				# especifica o servido de impressao para string
	syscall					# imprime
	
	la   	$a0, stringDestino_ncat		#carrega o endereco de "stringDestino"
      	li   	$v0, 4           		# especifica o servido de impressao para string
      	syscall               			# imprime 

	#------------------------------------------------
	#saida do sistema
	li $v0, 10
	syscall
	#-------------------------------------------------
#---------------------------------------------------------------------------------------------
	
	  j main		#retorna para o main ao fim da execu��o	
		
	chamada_strncpy: 
	
	
        #Lendo valor para a string e quantidade de caracteres para pegar dela
        #Mostrando mensagem de leitura e lendo
        la $a0, leituraString
        li $v0, 4
        syscall
        
        #Lendo a string
        la $a0, stringSource_cpy
        li $a1, 15
        li $v0, 8
        syscall 
        
        #mensagem de leitura qtd caracteres para pegar
        la $a0, leituraCount
        li $v0, 4
        syscall
        
        #lendo o valor para count
        li $v0, 5
        syscall
       
       #armazenando o valor lido em count
        la $t0, count
        sw $v0, 0($t0)
       
	# carregando enderecos
	la  $s0, stringDestino_cpy       	# endereco de "str_1" em $s0      	
      	la  $s1, stringSource_cpy       	# endereco de "str_2" em $s1
      	la  $s2, count			# endereco de "count" em $s2
      	      	
	#-----------------------------------
	
	#imprime aviso 1
      	la   $a0, aviso_1 
      	li   $v0, 4          # especifica a funcao para o syscall, que no caso � para imprimir string
      	syscall              # faz a chamada de system para imprimir a string
	
	#imprime valor da string 1
      	la   $a0, msg_1 
      	li   $v0, 4          # especifica a funcao para o syscall, que no caso � para imprimir string
      	syscall              # faz a chamada de system para imprimir a string
  
  	la   $a0, stringSource_cpy
      	li   $v0, 4           # especifica o servido de impressao a string
      	syscall               # imprime 
      	
      	#imprime valor da string 2
      	la   $a0, msg_2 
      	li   $v0, 4          # especiica o servico de impressao de string
      	syscall              # faz a chamada de system para imprimir a string
  
      	la   $a0, stringDestino_cpy
      	li   $v0, 4           # especifica o servido de impressao a string
      	syscall               # imprime 
      	
      	#------------------------------------
      	      	      	
      	# parametros da funcao
      	add  	$a0, $s0, $zero		# copiando endereco "stringDestino"
      	add  	$a1, $s1, $zero		# copiando endereco "stringSource"
      	lw	$a2, 0($s2)		# carrega o valor de "count" para $a2
      	
      	#chama a funcao
      	jal strncpy			#Retorna o endereco de stringDestino, no caso, n�o precisa ser utilizado...
      	
     	#----------------------------
     	# Mostrando o resultado
     	#----------------------------
     	
     	#imprime aviso 2
      	la   $a0, aviso_2 
      	li   $v0, 4          # especifica a funcao para o syscall, que no caso � para imprimir string
      	syscall              # faz a chamada de system para imprimir a string
     	
	#imprime valor da string 1
      	la   $a0, msg_1 
      	li   $v0, 4          # especifica a funcao para o syscall, que no caso � para imprimir string
      	syscall              # faz a chamada de system para imprimir a string
  
  	la   $a0, stringSource_cpy
      	li   $v0, 4           # especifica a funcao para o syscall, que no caso � para imprimir string
      	syscall               # imprime 
      	
      	#imprime valor da string 2
      	la   $a0, msg_2 
      	li   $v0, 4          # especiica o servico de impressao de string
      	syscall              # faz a chamada de system para imprimir a string
  
      	la   $a0, stringDestino_cpy
      	li   $v0, 4           # especifica o servido de impressao a string
      	syscall               # imprime 
      	
      	#------------------------------------------------------------------------------------

	 j main		#retorna para o main ao fim da execu��o			
		
		exitmain:
	li $v0, 10	# Finalizar o programa
	syscall		#executa a diretiva


#include das fun��es
.include "strlen.asm"	
.include "strcmp.asm"	
.include "strcat.asm"	
.include "strncat.asm"
.include "strncpy.asm"
