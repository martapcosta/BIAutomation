(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Graphiques`Camembert`"]
(* Exported symbols added here with SymbolName::usage *)  

creerCamembert::usage = "permet de creer un camembert des valeurs conformes et hors - tolerance."

Begin["`Private`"] (* Begin Private Context *) 

creerCamembert[nbOkKo_List] :=
    PieChart[
     #/Total[#] &[nbOkKo],
     ChartElementFunction -> "PlateauSector",
     LabelingFunction -> (Placed[
         Row[{Round[100 #], "%"}, BaseStyle -> 20], "RadialCenter"] &),
     ChartStyle -> Lighter /@ {Green, Red},
     ImageSize -> {240, 240}]

End[] (* End Private Context *)

EndPackage[]