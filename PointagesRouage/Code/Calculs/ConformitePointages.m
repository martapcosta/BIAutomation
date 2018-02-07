(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Calculs`ConformitePointages`"]
(* Exported symbols added here with SymbolName::usage *)  

calculerPointagesConformes::usage = "retourne {nbPointagesOK, nbPointagesKO}"

Begin["`Private`"] (* Begin Private Context *) 

calculerPointagesConformes[couleurPointsPlatine_] :=
    Map[{Count[Values[#], Darker[Green]], 
    Count[Values[#], Red]} &, couleurPointsPlatine, {1}]

End[] (* End Private Context *)

EndPackage[]