{


Trabalho final Estrutura de Dados

Baseando-se na estrutura de dados em árvore “untArvore”, desenvolva as seguintes rotinas :

Inserir : Conforme as regras de uma árvore binária de busca. (Elemento menor que a raiz deve ser inserido na sub-árvore esquerda; Elemento maior que a raiz deve ser inserido na sub-árvore direita).

Remover : Conforme as regras de uma árvore binária de busca.


Exibir Em nível: No exemplo da árvore A1, teríamos a seguinte exibição : a, b, c, d, f, g, h, i

}


Program arvorep;

Uses crt, untArvore;


Procedure Inserir(var Arvore:T_Arvore);
Var
    Elemento : T_Item;
Begin
    clrscr;
    writeln('Digite o elemento');
    readln(Elemento.Campo);
    untArvore.Inserir(Arvore, Elemento);
    
    writeln;writeln('pressione uma tecla para continuar....');readkey;
End;

Procedure Deletar(var Arvore:T_Arvore);
Begin;
End;
Procedure Exibir(var Arvore:T_Arvore);
Begin
End;

Procedure Menu(var Arvore:T_Arvore);
Var
    opcao:integer;
Begin
    clrscr;
    writeln(' ______________________________________________________________ ');
    writeln('|                                                              |');
    writeln('|              Trabalho Final Estrutura de Dados               |');
    writeln('|                  Arvore de Busca Binaria                     |');
    writeln('|            por Eduardo Junior, Mario Montino, Adriano        |');
    writeln('|______________________________________________________________|');
    writeln('|                                                              |');
    writeln('|                   ESCOLHA UMA OPÇÃO                          |');
    writeln('|                                                              |');
    writeln('| 1: Inserir                                                   |');
    writeln('| 2: Deletar                                                   |');
    writeln('| 3: Exibir                                                    |');
    writeln('| 4: Sair                                                      |');
    writeln('|______________________________________________________________|');                                            
    write('>> ');readln(opcao);
    case opcao of 
	1 : begin Inserir(Arvore); Menu(Arvore); end;
	2 : begin Deletar(Arvore); Menu(Arvore); end;
	3 : begin Exibir(Arvore); Menu(Arvore); end;
	4 : begin
	    writeln('Saindo do programa. See you later!!!');
	    exit;
	end;
    else
	clrscr;
	textcolor(red);
	writeln('Escolheu uma opção inválida');
	textcolor(black);
	delay(3000); {atraso de 3 segundos para exibicao da mensagem ao usuario e exibe o menu novamente}
	menu(Arvore);
    end;
End;

Var

	Arvore : T_Arvore;

Begin

	IniciarArvore(Arvore);
	Menu(Arvore);

End.
