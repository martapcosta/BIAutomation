(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Graphiques`CroixCentre`"]
(* Exported symbols added here with SymbolName::usage *)  

creerCroixCentre::usage = "permet de creer la representation graphique du centre d'un cercle."

Begin["`Private`"] (* Begin Private Context *) 

creerCroixCentre[centre_] :=
    {Line[{{centre - .05, 0}, {centre + .05, 0}}], 
    Line[{{centre, 0 - .05}, {centre, 0 + .05}}]}

End[] (* End Private Context *)

EndPackage[]