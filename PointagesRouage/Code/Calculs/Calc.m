(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Calculs`Calc`"]
(* Exported symbols added here with SymbolName::usage *)  

  MainFunction::usage = 
	"MainFunction[ x] computes a simple function."

  Begin[ "Private`"]

  MainFunction[ x_] :=
    Module[ {y},
      y = x^2;
      y + 1
    ]

  End[]

  EndPackage[]