(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Graphiques`IndicateurStatistiques`"]
(* Exported symbols added here with SymbolName::usage *)  

creerIndicateurStatistiques::usage = "permet de creer un indicateur statistiques."

Begin["`Private`"] (* Begin Private Context *) 

creerIndicateurStatistiques[valeurs_, limiteSuperieures_, moyenne_, ecartType_] :=
    Labeled[
     HorizontalGauge[
      valeurs,
      {0, limiteSuperieures},
      GaugeFaceStyle -> Lighter[Red],
      GaugeFaceElementFunction -> "GlassRectangle",
      GaugeFrameElementFunction -> "GlassRectangle",
      GaugeFrameStyle -> Directive[Darker[Red], EdgeForm[Black]],
      GaugeStyle -> LightRed,
      LabelStyle -> Black,
      TicksStyle -> Black,
      ImageSize -> {210, Automatic},
      PerformanceGoal -> "Speed"
      ],
     Row[{"\!\(\*OverscriptBox[\(x\), \(_\)]\)  ", 
       InputField[moyenne, Expression, FieldSize -> 3, Enabled -> False], 
       Spacer[20], "\[Sigma]  ", 
       InputField[ecartType, Expression, FieldSize -> 3, 
        Enabled -> False]}, Alignment -> {Center, Center}],
     Bottom
     ]

End[] (* End Private Context *)

EndPackage[]