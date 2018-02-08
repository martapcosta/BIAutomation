(* Wolfram Language Package *)

BeginPackage["PointagesRouage`Code`Calculs`Calc`"]
(* Exported symbols added here with SymbolName::usage *)  

  mainFunction::usage = 
	"mainFunction[x_] computes a simple function."

  Begin[ "`Private`"]

  mainFunction[x_] :=
    Module[ {y},
      y = x^2;
      y + 1
    ]

  End[]

  EndPackage[]