(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Constantes`"]
(* Exported symbols added here with SymbolName::usage *)  

coulFondTitrePan::usage = "coulFondTitrePan donne la couleur de fond des titres des panneaux. Son code RGB est RGBColor[0, 0.26, 0.5]."
coulFondPan::usage = "coulFondTitrePan donne la couleur de fond des panneaux. Son code RGB est RGBColor[0.753628, 0.82591, 0.991257]."
coulFondGen::usage = "coulFondGen donne la couleur de fond de l'application. Son code RGB est RGBColor[0, 0, 0.2]."
coulBout::usage = "coulBout donne la couleur des boutons."

Begin["`Private`"] (* Begin Private Context *) 

coulFondTitrePan = RGBColor[0, 0.26, 0.5]
coulFondPan = RGBColor[0.753628, 0.82591, 0.991257]
coulFondGen = RGBColor[0, 0, 0.2]
coulBout = GrayLevel[.8823529411764706]

End[] (* End Private Context *)

EndPackage[]