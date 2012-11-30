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
	if (Elemento.Campo > Arvore^.Item.Campo) then begin
	    writeln('o elemento é maior que o existente no no raiz criar arvore a direita ');
	end else begin
	    writeln('o elemento é menor criar a esquerda');
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
var Novo : T_Arvore;
begin
  if (Pai <> nil) Then
  begin
    if (Pai^.ESQ <> nil) Then
      writeln('Ja existe um filho a esquerda !')
    else
    begin
      new(Novo);
      Novo^.ESQ := nil;
      Novo^.DIR := nil;
      Novo^.Item := Item;

      Pai^.ESQ := Novo;
    end;
  end;
end;


procedure InserirItemDireita(var Pai : T_Arvore; Item : T_Item);
var Novo : T_Arvore;
begin
  if (Pai <> nil) Then
  begin
    if (Pai^.DIR <> nil) Then
      writeln('Ja existe um filho a direita !')
    else
    begin
      new(Novo);
      Novo^.ESQ := nil;
      Novo^.DIR := nil;
      Novo^.Item := Item;

      Pai^.DIR := Novo;
    end;
  end;
end;



End.
