(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`InterfaceGraphique`CadrePourGraphiques`"]
(* Exported symbols added here with SymbolName::usage *)  

creerCadreGraphique::usage = "creerCadreGraphique[graphique_]\npermet de creer le cadre d'un graphique."

Begin["`Private`"] (* Begin Private Context *) 

creerCadreGraphique[graphique_] :=
    Framed[graphique, RoundingRadius -> 10, Background -> White, 
     FrameStyle -> RGBColor[
      0.16862745098039217, 0.23921568627450981, 0.3803921568627451]]

End[] (* End Private Context *)

EndPackage[]