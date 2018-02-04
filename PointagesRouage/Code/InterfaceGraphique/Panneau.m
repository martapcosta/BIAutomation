(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`InterfaceGraphique`Panneau`"]

Needs["PointagesRouage`Code`Constantes`"]

(* Exported symbols added here with SymbolName::usage *)  

creerPanneau::usageSimple = "panneau[contenu, titre] permet de creer des panneaux simples."
creerPanneau::usageAvecValidation = "panneau[contenu_, titre_, texteCheckbox_, checkboxBooleen_, panneauActifBooleen_] permet de creer des panneaux avec validation du contenu."

Begin["`Private`"] (* Begin Private Context *) 

creerPanneau[contenu_, titre_] :=
    Panel[
         contenu,
         Highlighted[titre, BaseStyle -> {White, Bold}, 
      Background -> coulFondTitrePan, RoundingRadius -> 5],
     Background -> coulFondPan]
     
creerPanneau[contenu_, titre_, texteCheckbox_, checkboxBooleen_, 
  panneauActifBooleen_] :=
    DynamicModule[{checkboxBooleenDynamic = checkboxBooleen, 
      panneauActifBooleenDynamic = panneauActifBooleen}, 
     Panel[Framed[contenu, 
       FrameStyle -> 
        Dynamic[Directive[AbsoluteThickness[3], 
          If[ checkboxBooleenDynamic,
              Green,
              Red
          ]]]], 
      Grid[{{Highlighted[titre, BaseStyle -> {White, Bold}, 
          Background -> coulFondTitrePan, RoundingRadius -> 5], 
         Checkbox[Dynamic[checkboxBooleenDynamic], 
          Enabled -> Dynamic[panneauActifBooleenDynamic]], 
         Style[texteCheckbox, White]}}, Alignment -> {Left, Center}], 
      Background -> coulFondPan, FrameMargins -> -5, 
      Enabled -> Dynamic[panneauActifBooleenDynamic]]]

End[] (* End Private Context *)

EndPackage[]