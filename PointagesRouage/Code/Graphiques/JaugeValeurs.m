(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Graphiques`JaugeValeurs`"]

Needs["PointagesRouage`Code`Constantes`"]

(* Exported symbols added here with SymbolName::usage *)  

creerJaugeValeurs::usage = "permet de creer un indicateur de valeur avec tolerances."

Begin["`Private`"] (* Begin Private Context *) 

creerJaugeValeurs[valeurs_, range_, limInf_, limSup_] :=
    HorizontalGauge[
     Values[valeurs],
     range,
     LabelStyle -> Black,
     TicksStyle -> Black,
     GaugeFaceStyle -> coulFondPan,
     GaugeFrameStyle -> 
      Directive[coulFondTitrePan, EdgeForm[coulFondGen]],
     ScaleRanges -> {
       {{range[[1]], limInf[[1]]}, .1} -> Lighter[Red, .75],
       {{limInf[[1]], limSup[[1]]}, .1} -> Lighter[Green, .75],
       {{limSup[[1]], range[[2]]}, .1} -> Lighter[Red, .75]
       },
     ScaleRangeStyle -> EdgeForm[Black],
     GaugeMarkers -> 
      Graphics[{{EdgeForm[Black], Disk[{-.75, 0}, .7]}, {Opacity[0], 
         Disk[{0, 0}, .7]}}],
     GaugeStyle -> 
      Values[Between[#, {limInf[[1]], limSup[[1]]}] & /@ 
         valeurs /. {True -> Lighter[Green], False -> Lighter[Red]}],
     ImageSize -> {230, Automatic},
     PerformanceGoal -> "Speed"
     ]

End[] (* End Private Context *)

EndPackage[]