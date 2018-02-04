(* Wolfram Language Test file *)

Test[
    calculerPointagesConformes[{<|"Pt1" -> Darker[Green], 
    "Pt2" -> Darker[Green], "Pt3" -> Red|>, <|"Pt1" -> Red, 
    "Pt2" -> Red, "Pt3" -> Red|>}]
    ,
    {{2, 1}, {0, 3}}
    ,
    TestID -> "ConformitePointages-20180203-R0E3U0"
]