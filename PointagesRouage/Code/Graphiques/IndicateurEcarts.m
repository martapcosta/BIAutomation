(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Graphiques`IndicateurEcarts`"]

Needs["PointagesRouage`Code`Graphiques`IndicateurStatistiques`"]

(* Exported symbols added here with SymbolName::usage *)  

creerIndicateurEcarts::usage = "permet de creer l'indicateur des statistiques des ecarts des points \
hors-tolerance"

Begin["`Private`"] (* Begin Private Context *) 

creerIndicateurEcarts[ptKO_] :=
    Which[
       Length[#] == 1,
       creerIndicateurStatistiques[
        Round[First[#], .1],
        Round[First[#], .1] + 1,
        Round[First[#], .1],
        Null
        ],
       Length[#] > 1,
       creerIndicateurStatistiques[
        Function[{e}, Round[e, .1]] /@ #,
        Ceiling[1.1 Max[#], .1],
        Round[Mean[#], .1],
        Round[StandardDeviation[#], .1]
        ],
       True,
       creerIndicateurStatistiques[
        0,
        10,
        Null,
        Null
        ]
       ] &[1000 ptKO]

End[] (* End Private Context *)

EndPackage[]