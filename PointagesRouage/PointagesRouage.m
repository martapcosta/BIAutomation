(* Wolfram Language Package *)

BeginPackage["PointagesRouage`PointagesRouage`"]

Needs["PointagesRouage`Code`Constantes`"]
Needs["PointagesRouage`Code`InterfaceGraphique`Onglets`"]
Needs["PointagesRouage`Code`InterfaceGraphique`Panneau`"]
Needs["PointagesRouage`Code`InterfaceGraphique`CadrePourGraphiques`"]
Needs["PointagesRouage`Code`Graphiques`GraphiquePointages`"]
Needs["PointagesRouage`Code`Graphiques`Camembert`"]
Needs["PointagesRouage`Code`Graphiques`IndicateurEcarts`"]

(* Exported symbols added here with SymbolName::usage *)  

Begin["`Private`"] (* Begin Private Context *) 

pointagesRouage[] :=
    Deploy[Panel[
     Grid[{{Column[
         Row /@ {creerOngletGeneral /@ {"Configuration", 
             "Resultat global", "Resultat individuel", "Graphique"}, 
           creerOngletResultat /@ {"Pointage", "Entraxe", "Alignement"}},
          Alignment -> {Left, 
           Top}]}, {Grid[{{creerPanneau[
            creerCadreGraphique[
             creerGraphiquePointage[{0, 0}, 5, -5, 5, -5, 
              5, {{7, 5}, {2, 2}, {-1, -6}, {-2, -1}, {4, 1}}, {{7, 
                5}, {-1, -6}}, {Red, Darker[Green], Red, Darker[Green], 
               Darker[Green]}, {{4.07, 2.91}, {-.82, -4.93}}]], 
            "Pointages"], 
           creerPanneau[
            Column[{creerCamembert[{6, 4}], 
              creerIndicateurEcarts[{3.6, 1.08}]}, Alignment -> Center], 
            "Statistiques"]}}, Alignment -> {Left, Top}]}}, 
      Alignment -> {Left, Top}], Appearance -> "Frameless", 
     Background -> coulFondGen]]

End[] (* End Private Context *)

EndPackage[]