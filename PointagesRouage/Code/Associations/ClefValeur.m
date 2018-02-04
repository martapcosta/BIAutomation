(*Wolfram Language Package*)

BeginPackage["PointagesRouage`Code`Associations`ClefValeur`"]
(*Exported symbols added here with SymbolName::usage*)

separerClefValeur::usage = "permet de separer en liste les clefs et les valeurs d'une association imbriquee."

Begin["`Private`"] (*Begin Private Context*)

separerClefValeur[association_] :=
    KeyValueMap[{#, Values[#2]} &, association]

End[] (*End Private Context*)

EndPackage[]