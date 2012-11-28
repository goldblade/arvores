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


Implementation

Procedure IniciarArvore(var Arvore : T_Arvore);
Begin
	Arvore := nil;
End;

End.
