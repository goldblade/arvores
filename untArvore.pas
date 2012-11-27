unit untArvore;

interface

type
 T_Ponteiro = ^T_No;

 T_Item = record
       Campo : string;
     end;

 T_No = record
       Item : T_item;
       ESQ, DIR : T_Ponteiro;
     end;

 T_Arvore = T_Ponteiro;


procedure IniciarArvore(var Arvore : T_Arvore);
function chkArvoreVazia(var Arvore : T_Arvore) : boolean;
procedure criarRaiz(var Arvore : T_Arvore; Item : T_Item);
procedure InserirItemEsquerda(var Pai : T_Arvore; Item : T_Item);
procedure InserirItemDireita(var Pai : T_Arvore; Item : T_Item);

procedure exibirEmOrdem(var Arvore : T_arvore);
procedure exibirPreOrdem(var Arvore : T_arvore);
procedure exibirPosOrdem(var Arvore : T_arvore);

function buscaEmOrdem(var Arvore : T_arvore; Item : string) : T_Arvore;


Implementation

procedure IniciarArvore(var Arvore : T_Arvore);
begin
  Arvore := nil;
end;

function chkArvoreVazia(var Arvore : T_Arvore) : boolean;
begin
  chkArvoreVazia := Arvore = nil;
end;

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

procedure exibirEmOrdem(var Arvore : T_arvore);
begin
  if (Arvore <> nil) Then
  begin
    exibirEmOrdem(Arvore^.ESQ);
    write(Arvore^.Item.Campo, ' ');
    exibirEmOrdem(Arvore^.DIR);
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

procedure exibirPosOrdem(var Arvore : T_arvore);
begin
  if (Arvore <> nil) Then
  begin
    exibirPosOrdem(Arvore^.ESQ);
    exibirPosOrdem(Arvore^.DIR);
    write(Arvore^.Item.Campo, ' ');
  end;
end;


function buscaEmOrdem(var Arvore : T_arvore; Item : string) : T_Arvore;
var aux : T_Arvore;
begin
  if (Arvore <> nil) Then
  begin
    if (Arvore^.Item.Campo = Item) then
       aux := Arvore
    else
    begin
      aux := buscaEmOrdem(Arvore^.ESQ, Item);
      if (aux = nil) Then
        aux := buscaEmOrdem(Arvore^.DIR, Item);

    end;
  end;
  buscaEmOrdem := aux;

end;



end.
