(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`InterfaceGraphique`Encadre`"]

Needs["PointagesRouage`Code`Constantes`"]

(* Exported symbols added here with SymbolName::usage *)  

creerEncadre::usage = "permet de creer un encadre autour d'un contenu."

Begin["`Private`"] (* Begin Private Context *) 

creerEncadre[contenu_] :=
    Framed[contenu, Background -> coulBout, FrameStyle -> Gray, 
     RoundingRadius -> 5, Alignment -> Center]

End[] (* End Private Context *)

EndPackage[]