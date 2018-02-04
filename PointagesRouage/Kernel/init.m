Module[
 
 {nomApplication, repertoireApplication, fichiersApplication, 
  extensionFichiers, fichiersPaquets, contextesApplication, 
  cheminFichierInit},
 
 nomApplication = "PointagesRouage";
 
 cheminFichierInit = FindFile[nomApplication <> "`"];
 
 repertoireApplication = 
  FileNameJoin[
     Most[StringSplit[cheminFichierInit, 
       "\\" <> # <> "\\" -> "\\" <> #]]] &[nomApplication];
 
 fichiersApplication = 
  FileNames["*", repertoireApplication, \[Infinity]];
 
 extensionFichiers = FileExtension /@ fichiersApplication;
 
 fichiersPaquets = 
  DeleteCases[Pick[fichiersApplication, extensionFichiers, "m"], cheminFichierInit];
 
 contextesApplication = 
  StringDrop[
     StringSplit[
       StringCases[ReadString[#], 
         "BeginPackage[\"" ~~ context__ -> context][[1]], EndOfLine][[
      1]], -2] & /@ fichiersPaquets;
 
 Quiet[Get /@ contextesApplication];
 
 ]