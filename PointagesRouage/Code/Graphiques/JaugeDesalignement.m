(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Graphiques`JaugeDesalignement`"]
(* Exported symbols added here with SymbolName::usage *) 

creerJaugeDesalignement::usage = "permet de creer un indicateur d' alignement pont/platine." 

Begin["`Private`"] (* Begin Private Context *) 

creerJaugeDesalignement[alignement_] :=
    Labeled[HorizontalGauge[alignement, {0, Ceiling[1.1 Max[alignement]]}, 
      GaugeFaceStyle -> Lighter[Blue], 
      GaugeFaceElementFunction -> "GlassRectangle", 
      GaugeFrameElementFunction -> "GlassRectangle", 
      GaugeFrameStyle -> Directive[Darker[Blue], EdgeForm[Black]], 
      GaugeStyle -> LightBlue, LabelStyle -> Black, TicksStyle -> Black, 
      ImageSize -> {210, Automatic}, PerformanceGoal -> "Speed"], 
     Row[{"\!\(\*OverscriptBox[\(x\), \(_\)]\)  ", 
       InputField[Round[Mean[alignement]], Number, FieldSize -> 3, 
        Enabled -> False], Spacer[20], "\[Sigma]  ", 
       InputField[Round[StandardDeviation[alignement]], Number, FieldSize -> 3, 
        Enabled -> False]}, Alignment -> {Center, Center}], Bottom]

End[] (* End Private Context *)

EndPackage[]