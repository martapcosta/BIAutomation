(*Wolfram Language Package*)

BeginPackage["PointagesRouage`Code`Graphiques`GraphiquePointages`"]
(*Exported symbols added here with SymbolName::usage*)

creerGraphiquePointage::usage = "graphiquePointage[centre_, rayon_, xMin_, \
xMax_, yMin_, yMax_, pts_, ptsHS_, couleurPts_, projectionPtsHS_] \
permet de creer un graphique representant les pointages du rouage."

Begin["`Private`"] (*Begin Private Context*)

creerGraphiquePointage[centre_, rayon_, xMin_, xMax_, yMin_, yMax_, pts_, 
  ptsHS_, couleurPts_, projectionPtsHS_] :=
    Graphics[{{Thick, 
       Circle[centre, rayon]},(*Trace de la cible*){Text[
        xMin, {xMin, Last[centre]}, {0, -1}, {0, 1}], 
       Text[xMax, {xMax, Last[centre]}, {0, -1}, {0, -1}], 
       Text[yMin, {First[centre], yMin}, {0, 1}], 
       Text[yMax, {First[centre], 
         yMax}, {0, -1}]},(*Textes des coordonnees des limites de la \
    cible*){#, PointSize[Large], Point[#2]} & @@@ 
       MapThread[List, {couleurPts, pts}](*Trace des points*), 
      If[ ptsHS == {},
          {},
          {Red, Thick, Dashed, 
          Line[#] & /@ 
          Transpose[{ptsHS, 
          projectionPtsHS}]}
      ](*Trace des projections des points hors-
      tolerance*)}, ImageSize -> {240, 240}, Axes -> True, 
     AxesOrigin -> centre, 
     Ticks -> {{#, ""} & /@ FindDivisions[{xMin, xMax}, 10], {#, ""} & /@
         FindDivisions[{yMin, yMax}, 10]}]

End[] (*End Private Context*)

EndPackage[]