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

function buscaEmOrdem(var Arvore : T_arvore; Item : string) : T_Arvore;

procedure exibirEmOrdem(var Arvore : T_arvore);

procedure exibirEmNivel(var Arvore : T_arvore);

procedure exibirEmNivelAux(var Arvore : T_arvore; nivel:integer);

function contarNiveis(var Arvore: T_arvore): integer;

procedure exibirPreOrdem(var Arvore : T_arvore);


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
			{vou no filho do pai a esquerda e comparo o valor}
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

function buscaEmOrdem(var Arvore : T_arvore; Item : string) : T_Arvore;
begin

end;

procedure exibirEmOrdem(var Arvore : T_arvore);
begin
  if (Arvore <> nil) Then
  begin
    exibirEmOrdem(Arvore^.ESQ);
    write(Arvore^.Item.Campo, ' ');
    exibirEmOrdem(Arvore^.DIR);
  end;
end;


procedure exibirEmNivelAux(var Arvore : T_arvore; nivel:integer);
begin
    if (arvore <> nil) then begin

        if (nivel = 1) then begin
	   write(Arvore^.Item.Campo, ' ');
	end else if (nivel > 1) then begin
	    exibirEmNivelAux(Arvore^.ESQ, nivel-1);
	    exibirEmNivelAux(Arvore^.DIR, nivel-1);
    
	 end;


    end;

end;

procedure exibirEmNivel(var Arvore : T_arvore);
var
    i, altura : integer;
begin
    i:=0;
    If (Arvore <> nil) Then Begin
	altura := contarNiveis(Arvore);
	for i:=1 to altura do begin
	    exibirEmNivelAux(Arvore, i);
	    writeln;
	end;	  
    end;	    
end;

procedure exibirPreOrdem(var Arvore : T_arvore);
begin
  if (Arvore <> nil) Then
  begin
    write(Arvore^.Item.Campo, ' ');
    exibirPreOrdem(Arvore^.ESQ);
    exibirPreOrdem(Arvore^.DIR);
  end;
end;



function contarNiveis(var Arvore: T_arvore): integer;
var 
    iL: integer;
    iR: integer;
    aux : T_arvore;
begin
    iL:=1;
    iR:=1;
    aux:= Arvore;
    while (aux^.ESQ<>NIL) do begin
	iL := iL + 1;
	aux := aux^.ESQ;	
    end;

    aux := Arvore;
    while (aux^.DIR<>NIL) do begin
	iR := iR + 1;
	aux := aux^.DIR;
    end;
    if (iL >= iR) then 
	contarNiveis := iL
    else contarNiveis := iR;

end;

End.
