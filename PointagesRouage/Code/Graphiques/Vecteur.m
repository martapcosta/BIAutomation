(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Graphiques`Vecteur`"]
(* Exported symbols added here with SymbolName::usage *)  

creerVecteur::usage = "permet de dessiner un vecteur."

Begin["`Private`"] (* Begin Private Context *) 

creerVecteur[pt1_, 
  pt2_, {couleurDebut_, couleurFin_}] :=
    {{Thickness[Medium], 
    Line[{pt1, pt1 + .97 (pt2 - pt1)}, VertexColors -> {couleurDebut, couleurFin}]}, {couleurFin,
    Thickness[Medium], Arrowheads[Medium], 
    Arrow[{pt1 + .97 (pt2 - pt1), pt2}]}}

End[] (* End Private Context *)

EndPackage[]