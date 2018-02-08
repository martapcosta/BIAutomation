(* Wolfram Language Test file *)

Test[
    2
    ,
    "2"
    ,
    TestID->"Example"
]

Test[
    MainFunction[x]
    ,
    x^2+1
    ,
    TestID->"Example1"
]

Test[
    MainFunction[x^2]
    ,
    x^4+1
    ,
    TestID->"Example2"
]

Test[
    MainFunction[6]
    ,
    37
    ,
    TestID->"Example3"
]