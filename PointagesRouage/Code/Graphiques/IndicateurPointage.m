(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Graphiques`IndicateurPointage`"]

Needs["PointagesRouage`Code`InterfaceGraphique`Encadre`"]

(* Exported symbols added here with SymbolName::usage *)  

indicateurPointage::usage = "permet de creer un indicateur pour les resultats individuels des \
pointages."

Begin["`Private`"] (* Begin Private Context *) 

indicateurPointage[pointPlatine_, pointPont_, tolerance_, rangeMax_, mobile_] :=
    Grid[{{creerEncadre[
        mobile]}, {AngularGauge[{Round[1000*pointPlatine], Round[1000*pointPont]}, {0, 
         Round[1000*rangeMax*1.1]}, ImageSize -> 220, 
        ScaleOrigin -> {\[Pi], 0}, 
        ScaleRanges -> {Round[1000*tolerance], Round[1000*rangeMax*1.1]}, 
        ScaleRangeStyle -> Red, 
        GaugeStyle -> {ColorData[97, "ColorList"][[1]], 
          ColorData[97, "ColorList"][[2]]}, 
        PerformanceGoal -> 
         "Speed"]}, {Grid[{{Framed[
           Style[Round[1000*pointPlatine], Bold, 30, If[ pointPlatine > tolerance,
                                                         Red,
                                                         Black
                                                     ]], 
           Background -> 
            Lighter[ColorData[97, "ColorList"][[1]], 
             If[ pointPlatine > tolerance,
                 .5,
                 0
             ]], 
           ImageSize -> ({#, #/GoldenRatio} &[100]), RoundingRadius -> 5,
            Alignment -> Center, 
           FrameStyle -> 
            If[ pointPlatine > tolerance,
                Directive[Red, Thickness[2]],
                Automatic
            ]], 
          Framed[Style[Round[1000*pointPont], Bold, 30, 
            If[ pointPont > tolerance,
                Red,
                Black
            ]], 
           Background -> 
            Lighter[ColorData[97, "ColorList"][[2]], 
             If[ pointPont > tolerance,
                 .5,
                 0
             ]], 
           ImageSize -> ({#, #/GoldenRatio} &[100]), RoundingRadius -> 5,
            Alignment -> Center, 
           FrameStyle -> 
            If[ pointPont > tolerance,
                Directive[Red, Thickness[2]],
                Automatic
            ]]}}]}}, 
     Alignment -> {Center, Center}]

End[] (* End Private Context *)

EndPackage[]