(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`InterfaceGraphique`Onglets`"]

Needs["PointagesRouage`Code`Constantes`"]
Needs["PointagesRouage`Code`Variables`"]

(* Exported symbols added here with SymbolName::usage *)  

creerOngletGeneral::usage = "ongletGeneral[label] permet de creer un onglet general."
creerOngletResultat::usage = "ongletResultat[label] permet de creer un onglet resultat."

Begin["`Private`"] (* Begin Private Context *) 

creerOngletGeneral[label_] :=
    DynamicModule[{coulFondGenDynamic, coulFondPanDynamic}, 
     coulFondGenDynamic = coulFondGen;
     coulFondPanDynamic = coulFondPan;
     Button[Dynamic[
       Style[label, Bold, If[ tabGen === label,
                              White,
                              Black
                          ]]], 
      tabGen = label, 
      Appearance -> Dynamic[If[ tabGen === label,
                                "Pressed",
                                Automatic
                            ]], 
      Background -> 
       Dynamic[If[ tabGen === label,
                   coulFondGen,
                   coulFondPan
               ]]]]
     
creerOngletResultat[label_] :=
    Button[
     Dynamic[Style[label, Bold, If[ tabResultat === label,
                                    White,
                                    Black
                                ]]],
     tabResultat = label,
     Appearance -> Dynamic[If[ tabResultat === label,
                               "Pressed",
                               Automatic
                           ]],
     Background -> 
      Dynamic[If[ tabResultat === label,
                  coulFondGen,
                  coulFondPan
              ]]
     ]

End[] (* End Private Context *)

EndPackage[]