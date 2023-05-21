
programa
{
	inclua biblioteca Texto --> tex
	inclua biblioteca Tipos --> tp
	inclua biblioteca Util --> ut
	funcao inicio()
	{
		inteiro num_char, cont_naoha = 0, indice = 0, erros = 0
		cadeia string, str_plv = ""
		caracter letra, letras_err[26], plv_secreta[20], plv[20]
		logico repetida = falso, certo = falso, perdeu = falso
		escreva("Digite uma palavra para ser adivinhada, não deixe seu amigo olhar!\n")
		leia(string)
		num_char = tex.numero_caracteres(string) //retorna com caractere nulo
		escreva(num_char, "\n")
		//transforma entrada em vetor, inicializa plv (o que vai sendo escrito)
		para(inteiro i = 0; i < num_char; i++){
			plv_secreta[i] = tex.obter_caracter(string, i)
			plv[i] = '_'
		}
		
		enquanto(verdadeiro){
			limpa()
			escolha(erros){
				caso 0:
				pare
				
				caso 1:
				escreva("---------\n")
				escreva("|   |    \n")
				escreva("|  (..)  \n")
				escreva("|        \n")
				escreva("|        \n")
				escreva("|        \n")
				pare
				
				caso 2:
				escreva("---------\n")
				escreva("|   |    \n")
				escreva("|  (..)  \n")
				escreva("|   ||    \n")
				escreva("|        \n")
				escreva("|        \n")
				pare

				caso 3:
				escreva("---------\n")
				escreva("|   |    \n")
				escreva("|  (..)  \n")
				escreva("|  /||   \n")
				escreva("|        \n")
				escreva("|        \n")
				pare

				caso 4:
				escreva("---------\n")
				escreva("|   |    \n")
				escreva("|  (..)  \n")
				escreva("|  /||\\ \n")
				escreva("|        \n")
				escreva("|        \n")
				pare

				caso 5:
				escreva("---------\n")
				escreva("|   |    \n")
				escreva("|  (..)  \n")
				escreva("|  /||\\ \n")
				escreva("|   /    \n")
				escreva("|        \n")
				pare

				caso 6:
				escreva("---------\n")
				escreva("|   |    \n")
				escreva("|  (xx)  \n")
				escreva("|  /[]\\ \n")
				escreva("|   /\\ \n")
				escreva("|        \n")
				perdeu = verdadeiro
				pare
			}
			se(perdeu == verdadeiro){
				escreva("\nO homem foi enforcado, você perdeu :(")
				pare  
			}
			para(inteiro i = 0; i < num_char; i++){
				se(plv_secreta[i] == plv[i]){
					certo = verdadeiro
				}senao{
					certo = falso
					pare
				}
			}
			
			se(certo == verdadeiro){
				escreva("Parabéns você acertou e salvou o homem!")
				pare
			}
			
			para(inteiro i = 0; i < num_char; i++){
				escreva(plv[i])
			}
			escreva("\n\nDigite uma letra\n")
			leia(letra)
			//verifica quantas vezes a letra vai aparecer na palavra
			para(inteiro i = 0; i < num_char; i++){
				//acerta a letra
				se (plv_secreta[i] == letra){
					plv[i] = letra
				}senao{
					cont_naoha++
				}
			}
			se (cont_naoha == num_char){ //nao tem a letra
				para(inteiro i = 0; i <= indice; i++){
					se(letra == letras_err[i]){ //repetida
						erros++
						escreva("Você já digitou '", letra, "' antes, não há na palavra")
						ut.aguarde(1500)
						repetida = verdadeiro
						pare
					}senao{
						repetida = falso	
					}
				}
				se (repetida == falso){
					erros++
					escreva("Não há '", letra ,"' na palavra :(")
					letras_err[indice] = letra
					indice++
					ut.aguarde(1500)
				}
				
			}
			cont_naoha = 0
		}	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2273; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */