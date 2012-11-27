Program PrincipalArvore;

uses crt, untArvore;

var Arvore, subArvorePai : T_Arvore;
    Item, ItemPai : T_Item;

begin

  IniciarArvore(Arvore);

  Item.Campo := 'a';
  untArvore.criarRaiz(Arvore, Item);

  subArvorePai := buscaEmOrdem(Arvore,'a');
  Item.Campo := 'b';
  untArvore.InserirItemEsquerda(subArvorePai, Item);
  Item.Campo := 'c';
  untArvore.InserirItemDireita(subArvorePai, Item);


  subArvorePai := buscaEmOrdem(Arvore,'b');
  Item.Campo := 'd';
  untArvore.InserirItemEsquerda(subArvorePai, Item);
  Item.Campo := 'e';
  untArvore.InserirItemDireita(subArvorePai, Item);

  
  subArvorePai := buscaEmOrdem(Arvore,'c');
  Item.Campo := 'f';
  untArvore.InserirItemEsquerda(subArvorePai, Item);
  Item.Campo := 'g';
  untArvore.InserirItemDireita(subArvorePai, Item);


  subArvorePai := buscaEmOrdem(Arvore,'f');
  Item.Campo := 'h';
  untArvore.InserirItemEsquerda(subArvorePai, Item);
  Item.Campo := 'i';
  untArvore.InserirItemDireita(subArvorePai, Item);


  writeln;
  writeln;
  writeln('Em Ordem');
  exibirEmOrdem(Arvore);
  writeln;
  writeln;
  writeln('Pre Ordem');
  exibirPreOrdem(Arvore);
  writeln;
  writeln;
  writeln('Pos Ordem');
  exibirPosOrdem(Arvore);


  readkey;


end.
