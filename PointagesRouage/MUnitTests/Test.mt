(* Wolfram Language Test file *)

Test[
    2
    ,
    "2"
    ,
    TestID->"Example"
]

Test[
    mainFunction[x]
    ,
    x^2+1
    ,
    TestID->"Example1"
]

Test[
    mainFunction[x^2]
    ,
    x^4+1
    ,
    TestID->"Example2"
]

Test[
    mainFunction[6]
    ,
    37
    ,
    TestID->"Test-20180208-E0Y1L2"
]