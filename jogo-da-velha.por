programa
{
	caracter jogo [3][3]
	
	funcao inicio()
	{
		limpaJogo()
		inteiro linha = 0, coluna = 0
		logico jogador1 = verdadeiro, acabou = falso
		enquanto(nao acabou){
			imprimeJogo()

			se(jogador1) 
				escreva("vez do jogador 1")
			senao
				escreva("vez do jogador 2")

			logico ehValido = falso
			enquanto(nao ehValido) {
				escreva("\nentre com a linha da sua jogada: ") 
				leia(linha)
				escreva("entre com a coluna da sua jogada: ")
				leia(coluna)
				ehValido = jogadaValida(linha, coluna)	
			}
	
			se(jogador1){
				jogo[linha-1][coluna-1] = 'X'
				jogador1 = falso	
			}
			senao{
				jogo[linha-1][coluna-1] = 'O'
				jogador1 = verdadeiro	
			}
			
			imprimeJogo()
			acabou = confereVencedor()

			se(acabou) {
				se(nao jogador1) 
					escreva("Jogador 1 venceu")
				senao
					escreva("Jogador 2 venceu")
			}
		}
	}

	funcao limpaJogo() {
		para(inteiro i = 0; i < 3; i++) {
			para(inteiro j = 0; j < 3; j++) {
				jogo[i][j] = ' '
			}
		}
	}

	funcao imprimeJogo() {
		escreva("\n\n\n\n\n\n\n\n")
		para(inteiro i = 0; i < 3; i++) {
			escreva(jogo[i][0], " | ", jogo[i][1], " | ", jogo[i][2], "\n")
			se(i != 2)
				escreva("---------\n")
		}
	}

	funcao logico jogadaValida(inteiro linha, inteiro coluna) {
		se(linha <= 3 e coluna <= 3) {
			se(jogo[linha-1][coluna-1] == ' '){
				retorne verdadeiro	
			}
			senao{
				imprimeJogo()
				escreva("Jogada Inválida")
				retorne falso
			}
		}senao {
			imprimeJogo()
			escreva("Jogada Inválida")
			retorne falso	
		}
	}

	funcao logico confereVencedor() {
		logico acabouJogo = falso
		//confere linha
		para(inteiro i = 0; i < 3; i++) {
			se(jogo[i][0] == jogo[i][1] e jogo[i][1] == jogo[i][2] e jogo[i][0] != ' ') {
				acabouJogo = verdadeiro
			}
		}

		//confere coluna
		para(inteiro i = 0; i < 3; i++) {
			se(jogo[0][i] == jogo[1][i] e jogo[1][i] == jogo[2][i] e jogo[0][i] != ' ') {
				acabouJogo = verdadeiro
			}
		}

		//confere diagonais
		se(		((jogo[0][0] == jogo[1][1] e jogo[1][1] == jogo[2][2]) 
		    		ou 	(jogo[0][2] == jogo[1][1] e jogo[1][1] == jogo[2][0]))
		    		e	jogo[1][1] != ' '){
			acabouJogo = verdadeiro
		}

		retorne acabouJogo
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2085; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */