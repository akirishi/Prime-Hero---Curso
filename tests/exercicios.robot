*** Settings ***
Documentation		Aqui estarão presentes as resoluções de todos os exercicios do PrimeHero
...							É muit importante informamos o propósito deste documento

*** Variables ***
${NOME}		Fabiano Corrêa

&{PESSOA}
...		nome=Fabiano
...		sobrenome=Corrêa
...		diaaniv=6
...		mesaniv=3
...		anoaniv=2000
...		peso=110

@{FRUTAS}		
...		banana
...		maçã
...		abacaxi
...		uva
...		morango

*** Test Cases ***
Cenario: Imprimindo informações da pessoa
	[Tags]		PESSOAINFO
	Log To Console		\nNome: ${PESSOA.nome}
	Log To Console		Sobrenome: ${PESSOA.sobrenome}
	Log To Console		Dia de aniversário: ${PESSOA.diaaniv}
	Log To Console		Mês de aniversário: ${PESSOA.mesaniv}
	Log To Console		Ano de aniversário: ${PESSOA.anoaniv}
	Log To Console		Peso: ${PESSOA.peso}Kg

Cenario: Imprimindo lista de frutas
	[Tags]		LISTA
	Log To Console		\nFruta 1: ${FRUTAS[0]}
	Log To Console		Fruta 2: ${FRUTAS[1]}
	Log To Console		Fruta 3: ${FRUTAS[2]}
	Log To Console		Fruta 4: ${FRUTAS[3]}
	Log To Console		Fruta 5: ${FRUTAS[4]}

Cenario: Somando dois valores
	[Tags]		SOMA
	Somar dois números	10	10

Cenario: Criando um email
	[Tags]		EMAIL
	Criar email  fabiano  correa  21

Cenario: Contar
	[Tags]		CONTAR
	Contar de 0 a 9

Cenario: Vendo uma lista
	[Tags]		FRUTAS
	Percorrer itens de uma lista

Cenario: Estou no número x
	[Tags]		EX001
	Exercicio 1

Cenario: Lista de paises
	[Tags]		EX002
	Exercicio 2

Cenario: Comprando carro
	[Tags]		CARRO
	Escolher o carro  Branco

Cenario: Lista vazada
	[Tags]		EX003
	Exercicio 3

*** Keywords ***
Somar dois números
	[Arguments]		${NUM_A}		${NUM_B}
	${SOMA}		Evaluate		${NUM_A} + ${NUM_B}
	[Return]		${SOMA}

Criar email
	[Arguments]		${nome}		${sobrenome}		${idade}
	${EMAIL1}		Catenate		SEPARATOR=_		\n${nome}		${sobrenome}		${idade}@robot.com
	${EMAIL2}		Catenate		${nome}_${sobrenome}_${idade}@robot.com
	Log To Console		${EMAIL1}
	Log To Console		${EMAIL2}

Contar de 0 a 9
	FOR		${count}		IN RANGE		0		9
		Log To Console		\n${count}
	END

Percorrer itens de uma lista
	@{FRUTAS}		Create List		Banana		Maçã		Abacaxi		Morango
	FOR		${FRUTAS}		IN 		@{FRUTAS}
		Log To Console		\n${FRUTAS}
	END

Exercicio 1
	FOR		${count}		IN RANGE		0		11
		Log To Console		\nEstou no número: ${count}
	END

Exercicio 2
	@{PAISES}		Create List		Brasil		USA		França		Noruega		Alemanha
	FOR		${PAISES}		IN		@{PAISES}
		Log To Console		\n${PAISES}
	END

Escolher o carro
	[Arguments]		${COR_CARRO}
	IF		'${COR_CARRO}'=='Preto'
		Log To Console		\nEu gostaria de comprar esse carro
	ELSE IF		'${COR_CARRO}'=='Prata'
		Log To Console		\nEu gostaria de comprar esse carro, gostei da cor prata
	ELSE
		Log To Console		\nNão gostei dessa cor, não quero comprar
	END

Exercicio 3
	FOR		${count}		IN RANGE		0		11
		IF		'${count}'=='5'
			Log To Console		\nEstou no número: ${count}
		ELSE IF		'${count}'=='8'
			Log To Console		\nEstou no número: ${count}
		END
	END

Exercicio 4
	