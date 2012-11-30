Unit untArvore;

Interface

Type
 T_Ponteiro = ^T_No;

 T_Item = Record
       Campo : string;
     End;

 T_No = Record
       Item : T_item;
       ESQ, DIR : T_Ponteiro;
     End;

 T_Arvore = T_Ponteiro;


Procedure IniciarArvore(var Arvore : T_Arvore);
Function chkArvoreVazia(var Arvore : T_Arvore): boolean;
Procedure Inserir(var Arvore : T_Arvore; Elemento : T_Item);
procedure criarRaiz(var Arvore : T_Arvore; Item : T_Item);
procedure InserirItemEsquerda(var Pai : T_Arvore; Item : T_Item);
procedure InserirItemDireita(var Pai : T_Arvore; Item : T_Item);


Implementation

Procedure IniciarArvore(var Arvore : T_Arvore);
Begin
	Arvore := nil;
End;

Function chkArvoreVazia(var Arvore : T_Arvore) : boolean;
Begin
  chkArvoreVazia := Arvore = nil;
End;

Procedure Inserir(var Arvore : T_Arvore; Elemento : T_Item);
Begin
    {Verificar se ja existe raiz}
    if chkArvoreVazia(Arvore) then criarRaiz(Arvore, Elemento) else begin
		//writeln('O valor do elemento do pai é ', Arvore^.Item.Campo);
		if (Elemento.Campo > Arvore^.Item.Campo) then begin
	 	   //writeln('o elemento é maior que o existente no no raiz criar arvore a direita ');
			InserirItemDireita(Arvore, Elemento);
		end else begin
		    //writeln('o elemento é menor criar a esquerda');
			InserirItemEsquerda(Arvore, Elemento);
		end; 
    end;
End;

procedure criarRaiz(var Arvore : T_Arvore; Item : T_Item);
var noRaiz : T_Arvore;
begin
  new(noRaiz);
  noRaiz^.ESQ := nil;
  noRaiz^.DIR := nil;
  noRaiz^.Item := Item;

  Arvore := noRaiz;
end;

procedure InserirItemEsquerda(var Pai : T_Arvore; Item : T_Item);

var 

	Novo : T_Arvore;

begin

	If (Pai <> nil) Then Begin
	
		If (Pai^.ESQ <> nil) then begin
		
			writeln('Ja existe um filho a esquerda');
			// vou no filho do pai a esquerda e comparo o valor
			Novo := Pai^.ESQ;
			if (Item.Campo > Novo^.Item.Campo) then
				InserirItemDireita(Novo, Item)
			else
				InserirItemEsquerda(Novo, Item);


		end else begin

			writeln('novo nó filho criado');
			new(Novo);
			Novo^.ESQ := nil;
			Novo^.DIR := nil;
			Novo^.Item := Item;
			Pai^.ESQ := Novo;
			
		end;

	end else writeln('error');

end;


procedure InserirItemDireita(var Pai : T_Arvore; Item : T_Item);
var Novo : T_Arvore;
begin

	If (Pai <> nil) Then Begin
	
		If (Pai^.DIR <> nil) then begin
		
			writeln('Ja existe um filho a direita');
			// vou no filho do pai a esquerda e comparo o valor
			Novo := Pai^.DIR;
			if (Item.Campo > Novo^.Item.Campo) then
				InserirItemDireita(Novo, Item)
			else
				InserirItemEsquerda(Novo, Item);


		end else begin

			writeln('novo nó filho criado');
			new(Novo);
			Novo^.ESQ := nil;
			Novo^.DIR := nil;
			Novo^.Item := Item;
			Pai^.DIR := Novo;
			
		end;

	end else writeln('error');

end;



End.
