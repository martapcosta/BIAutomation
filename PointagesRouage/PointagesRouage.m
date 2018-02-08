(* Wolfram Language Package *)

BeginPackage["PointagesRouage`PointagesRouage`"]

Needs["PointagesRouage`Code`Constantes`"]
Needs["PointagesRouage`Code`Variables`"]
Needs["PointagesRouage`Code`InterfaceGraphique`Onglets`"]
Needs["PointagesRouage`Code`InterfaceGraphique`Panneau`"]
Needs["PointagesRouage`Code`InterfaceGraphique`CadrePourGraphiques`"]
Needs["PointagesRouage`Code`Graphiques`GraphiquePointages`"]
Needs["PointagesRouage`Code`Graphiques`Camembert`"]
Needs["PointagesRouage`Code`Graphiques`IndicateurEcarts`"]
Needs["PointagesRouage`Code`Graphiques`JaugeValeurs`"]
Needs["PointagesRouage`Code`Graphiques`JaugeDesalignement`"]
Needs["PointagesRouage`Code`Graphiques`Vecteur`"]
Needs["PointagesRouage`Code`Graphiques`CroixCentre`"]
Needs["PointagesRouage`Code`Graphiques`IndicateurPointage`"]

(* Exported symbols added here with SymbolName::usage *)  

pointagesRouage::usage = "Lance l'application d'analyse des pointages d'un rouage."

Begin["`Private`"] (* Begin Private Context *) 

pointagesRouage[] :=
    Deploy[Panel[
     Grid[{{Column[
         Row /@ {creerOngletGeneral /@ {"Configuration", 
             "Resultat global", "Resultat individuel", "Graphique"}, 
           creerOngletResultat /@ {"Pointage", "Entraxe", "Alignement"}},
          Alignment -> {Left, 
           Top}]}, {PaneSelector[{"Configuration"->Grid[{{Grid[{{FileNameSetter[
    Dynamic[fichier,(fichier = #;
                     analyse = True)&],
    "Open",
    {"Fichiers texte" -> {"*.txt"}},
    WindowTitle -> "Selectionner le fichier de mesure",
    Appearance -> "Fichier de mesure..."
    ], InputField[Dynamic[fichier], String, FieldSize -> 66]}}]},{Grid[{{creerPanneau[
            creerCadreGraphique[
             Dynamic[If[ analyse,
                         creerGraphiquePointage[{0, 0}, 5, -5, 5, -5, 
                         5, {{7, 5}, {2, 2}, {-1, -6}, {-2, -1}, {4, 1}}, {{7, 
                         5}, {-1, -6}}, {Red, Darker[Green], Red, Darker[Green], 
                         Darker[Green]}, {{4.07, 2.91}, {-.82, -4.93}}],
                         creerGraphiquePointage[{0, 
                         0}, 5, -5, 5, -5, 5, {}, {}, {}, {{4.07, 2.91}, {-.82, -4.93}}]
                     ]]], 
            "Pointages"], 
           creerPanneau[
            Column[{Dynamic[If[ analyse,
                                creerCamembert[{6, 4}],
                                creerCamembert[{1,0}]
                            ]], 
              Dynamic[If[ analyse,
                          creerIndicateurEcarts[{3.6, 1.08}],
                          creerIndicateurEcarts[{}]
                      ]]}, Alignment -> Center], 
            "Statistiques"],Column[{Dynamic[If[ analyse,
                                                indicateurPointage[.001, .003, .002, .004, "Mobile platine"],
                                                indicateurPointage[0, 0, 0, .004, "Mobile platine"]
                                            ]],Dynamic[If[ analyse,
                                                           creerJaugeValeurs[<|"a" -> 1, "b" -> 2, "c" -> 3, "d" -> 4, 
                                                           "e" -> 5|>, {0, 6}, {1.5}, {4.5}],
                                                           creerJaugeValeurs[<|"a" -> 0, "b" -> 0, "c" -> 0, "d" -> 0, 
                                                           "e" -> 0|>, {0, 6}, {1.5}, {4.5}]
                                                       ]]}]}}]},{creerPanneau[
    creerCadreGraphique[
    LocatorPane[
     Dynamic[posLabelRouage, {(posLabelRouage = #) &, (posLabelRouage \
    = Function[{pos}, 
            Which @@ 
             Flatten[
              Append[MapThread[
                Function[{cible, centre, 
                  rayon}, {IntervalMemberQ[cible, 
                   First[pos]], {centre, 
                   rayon + .3}}], {cibleRecherche, centreXRouage, 
                 rayonRouage}], {True, pos}], 1]] /@ #) &}], 
     Graphics[{{Thick, 
        MapThread[
         Circle[{#, 0}, #2] &, {centreXRouage, 
          rayonRouage}]}, {creerCroixCentre /@ centreXRouage}, 
       Dynamic[MapThread[
         Text[Style[#, 14], {#2, -.25}] &, {rouageFinissage[[All, 2]],
           posLabelRouage[[All, 1]]}]], {FaceForm[], 
        EdgeForm[{Dashed}], Rectangle @@@ posCibleLabelRouage}}, 
      ImageSize -> 750, PlotRange -> {Automatic, {Automatic, 1.5}}], 
     Appearance -> (Framed[#, 
          Background -> GrayLevel[.8823529411764706], 
          FrameStyle -> Gray, RoundingRadius -> 5, 
          Alignment -> Center] & /@ rouageFinissage[[All, 1]])]], "Definition du rouage de finissage", "Valider le \
rouage de finissage", 
    False, True]}},Alignment->{Left,Top}],"Resultat individuel"->Grid[{{Grid[{{creerPanneau[
       SetterBar[
        Dynamic[selectionMouvement], # -> 
           Pane[Style[#, 25], {#, #/GoldenRatio} &[120], 
            Alignment -> {Center, Center}] & /@ mouvements], 
       "Mouvement"], 
      creerPanneau[TogglerBar[
        Dynamic[selectionLigneRouage], # -> 
           Pane[Style[#, 25], {#, #/GoldenRatio} &[120], 
            Alignment -> {Center, Center}] & /@ {"Platine", "Pont"}], 
       "Ligne de rouage"]}}, Alignment -> {Left, Top}]}, {Grid[{{Panel[
           PaneSelector[
        Function[{m}, m -> creerCadreGraphique[Dynamic[Graphics[{
               
               (*Trace des cible*)
               
               MapThread[
                Scale[{Thick, Circle[#, #2]}, 
                  zoom] &, {Values[#[[m]] & /@ centreCiblePlatine], 
                 Values[#[[m]] & /@ rayonCiblePlatine]}],
               
               (*Trace du texte des mobiles*)
               
               MapThread[{Text[
                   Style[StringTake[#, 3], 
                    Rescale[zoom, {1, 300}, {1, 35}], Gray, 
                    Bold], #2]} &, {mobiles, 
                 Values[#[[m]] & /@ centreCiblePlatine]}],
               
               (*Trace des pointages*)
               
               MapThread[{Opacity[
                   If[ MemberQ[selectionLigneRouage, "Platine"],
                       1,
                       0
                   ]], ColorData[97, "ColorList"][[1]], 
                  PointSize[Large], 
                  Point[zoom (# - #2) + #]} &, {Values[#[[m]] & /@ 
                   pointsPlatine], 
                 Values[#[[m]] & /@ centreCiblePlatine]}],
               
               MapThread[{Opacity[
                   If[ MemberQ[selectionLigneRouage, "Pont"],
                       1,
                       0
                   ]], 
                  ColorData[97, "ColorList"][[2]], PointSize[Large], 
                  Point[zoom (# - #2) + #]} &, {Values[#[[m]] & /@ 
                   pointsPont], Values[#[[m]] & /@ centreCiblePont]}],
               
               (*Trace de la ligne de rouage*)
               {Opacity[
                 If[ MemberQ[selectionLigneRouage, "Platine"],
                     1,
                     0
                 ]], 
                ColorData[97, "ColorList"][[1]], Thick, 
                Line[MapThread[
                  zoom (# - #2) + # &, {Values[#[[m]] & /@ 
                    pointsPlatine], 
                   Values[#[[m]] & /@ centreCiblePlatine]}]]},
               {Opacity[
                 If[ MemberQ[selectionLigneRouage, "Pont"],
                     1,
                     0
                 ]], 
                ColorData[97, "ColorList"][[2]], Thick, 
                
                Line[MapThread[
                  zoom (# - #2) + # &, {Values[#[[m]] & /@ 
                    pointsPont], 
                   Values[#[[m]] & /@ centreCiblePont]}]]},
               
               (*Trace de la legende*)
               Locator[Dynamic[positionLegende], Highlighted[Grid[{
                   {Pane[Graphics[{Thick, Circle[]}], {40, 40}], 
                    Style["Cible nominale", 20]},
                   {Pane[
                    Graphics[{ColorData[97, "ColorList"][[1]], Thick, 
                    Line[{{-1, 0}, {1, 0}}], PointSize[Large], 
                    Point[{0, 0}]}], {40, 40}], Style["Platine", 20]},
                   {Pane[
                    Graphics[{ColorData[97, "ColorList"][[2]], Thick, 
                    Line[{{-1, 0}, {1, 0}}], PointSize[Large], 
                    Point[{0, 0}]}], {40, 40}], Style["Pont", 20]}},
                  Alignment -> {{Right, Left}, Center}], 
                 Background -> GrayLevel[.95], RoundingRadius -> 5, 
                 Frame -> True, FrameStyle -> Directive[Thick, Gray]]]
               
               }, ImageSize -> {1100, 1100/GoldenRatio}]]]] /@ 
         mouvements, Dynamic[selectionMouvement], 
        ImageSize -> Automatic],
           Grid[{{Highlighted["Graphique", BaseStyle -> {White, Bold}, 
           Background -> RGBColor[0., 0.26, 0.5], 
           RoundingRadius -> 5], Spacer[20], 
          Style["Facteur d'echelle", White], 
          Slider[Dynamic[zoom], {1, 300, 1}], 
          InputField[Dynamic[zoom], Number, FieldSize -> 2], 
          Style[": 1", White]}}, Alignment -> {Left, Center}],
       Background -> RGBColor[0.753628, 0.82591, 0.991257]]
      }}, Alignment -> {Left, Top}]}}, Alignment -> {Left, Top}]},Dynamic[tabGen]]}}, 
      Alignment -> {Left, Top}], Appearance -> "Frameless", 
     Background -> coulFondGen]]

End[] (* End Private Context *)

EndPackage[]