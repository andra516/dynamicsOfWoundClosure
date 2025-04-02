assums = {Superscript[Subscript[R, 1], 0][t] > 0, 
     Superscript[Subscript[R, 2], 0][t] > 0, 
     Element[Subscript[\[Epsilon], \[Alpha]], Reals], 
     Element[\[CapitalLambda], Reals], \[CapitalLambda] \[NotEqualTilde] 1}
 
increaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n + 2, x] - 
      2*((n + 1)/x)*BesselK[n + 1, x]
 
decreaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n - 2, x] + 
      2*((n - 1)/x)*BesselK[n - 1, x]
 
splitBesselK[n_, x_] := BesselK[n, x] -> (x/(2*n))*(BesselK[n + 1, x] - 
       BesselK[n - 1, x])
 
increaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n + 2, x] + 
      2*((n + 1)/x)*BesselI[n + 1, x]
 
decreaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n - 2, x] - 
      2*((n - 1)/x)*BesselI[n - 1, x]
 
splitBesselI[n_, x_] := BesselI[n, x] -> (x/(2*n))*(BesselI[n - 1, x] - 
       BesselI[n + 1, x])
 
splitBessels[n_, x_] := {splitBesselK[n, x], splitBesselI[n, x]}
 
increaseBessels[n_, x_] := {increaseBesselK[n, x], increaseBesselI[n, x]}
 
decreaseBessels[n_, x_] := {decreaseBesselK[n, x], decreaseBesselI[n, x]}
 
repIncreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, increaseBessels[nList[[K]], x]]]; repList]
 
repDecreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, decreaseBessels[nList[[K]], x]]]; repList]
 
Rearrange[eqn_, var_] := Module[{varCoeff, other, EQN}, 
     EQN = SubtractSides[eqn, eqn[[2]]]; varCoeff = Coefficient[EQN[[1]], 
        var]; other = Simplify[EQN[[1]] - varCoeff*var]; 
      Simplify[-other/varCoeff]]
 
FindUnknowns[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
FindUnknowns2[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False]; ); repSol = Table[unknowns[[m]] -> sol[[m]], 
        {m, 1, Length[unknowns]}]; Print[FullSimplify[eqns /. repSol]]; 
      repSol]
 
FindUnknowns3[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns4[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False, Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
createDirectory[relPath_] := Module[{}, SetDirectory[NotebookDirectory[]]; 
      Quiet[CreateDirectory[relPath]]; ]
assums = {Superscript[Subscript[R, 1], 0][t] > 0, 
     Superscript[Subscript[R, 2], 0][t] > 0, 
     Element[Subscript[\[Epsilon], \[Alpha]], Reals], 
     Element[\[CapitalLambda], Reals], \[CapitalLambda] \[NotEqualTilde] 1}
 
increaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n + 2, x] - 
      2*((n + 1)/x)*BesselK[n + 1, x]
 
decreaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n - 2, x] + 
      2*((n - 1)/x)*BesselK[n - 1, x]
 
splitBesselK[n_, x_] := BesselK[n, x] -> (x/(2*n))*(BesselK[n + 1, x] - 
       BesselK[n - 1, x])
 
increaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n + 2, x] + 
      2*((n + 1)/x)*BesselI[n + 1, x]
 
decreaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n - 2, x] - 
      2*((n - 1)/x)*BesselI[n - 1, x]
 
splitBesselI[n_, x_] := BesselI[n, x] -> (x/(2*n))*(BesselI[n - 1, x] - 
       BesselI[n + 1, x])
 
splitBessels[n_, x_] := {splitBesselK[n, x], splitBesselI[n, x]}
 
increaseBessels[n_, x_] := {increaseBesselK[n, x], increaseBesselI[n, x]}
 
decreaseBessels[n_, x_] := {decreaseBesselK[n, x], decreaseBesselI[n, x]}
 
repIncreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, increaseBessels[nList[[K]], x]]]; repList]
 
repDecreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, decreaseBessels[nList[[K]], x]]]; repList]
 
Rearrange[eqn_, var_] := Module[{varCoeff, other, EQN}, 
     EQN = SubtractSides[eqn, eqn[[2]]]; varCoeff = Coefficient[EQN[[1]], 
        var]; other = Simplify[EQN[[1]] - varCoeff*var]; 
      Simplify[-other/varCoeff]]
 
ConvertToMatrixProb[eqns_, unknowns_] := Module[{EQNS, Mat, BVec}, 
     EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
      Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
        {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
      BVec = Mat . unknowns - EQNS; {Mat, BVec}]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
FindUnknowns[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns2[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False]; ); repSol = Table[unknowns[[m]] -> sol[[m]], 
        {m, 1, Length[unknowns]}]; Print[FullSimplify[eqns /. repSol]]; 
      repSol]
 
FindUnknowns3[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns4[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False, Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
createDirectory[relPath_] := Module[{}, SetDirectory[NotebookDirectory[]]; 
      Quiet[CreateDirectory[relPath]]; ]
assums = {Superscript[Subscript[R, 1], 0][t] > 0, 
     Superscript[Subscript[R, 2], 0][t] > 0, 
     Element[Subscript[\[Epsilon], \[Alpha]], Reals], 
     Element[\[CapitalLambda], Reals], \[CapitalLambda] \[NotEqualTilde] 1}
 
increaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n + 2, x] - 
      2*((n + 1)/x)*BesselK[n + 1, x]
 
decreaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n - 2, x] + 
      2*((n - 1)/x)*BesselK[n - 1, x]
 
splitBesselK[n_, x_] := BesselK[n, x] -> (x/(2*n))*(BesselK[n + 1, x] - 
       BesselK[n - 1, x])
 
increaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n + 2, x] + 
      2*((n + 1)/x)*BesselI[n + 1, x]
 
decreaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n - 2, x] - 
      2*((n - 1)/x)*BesselI[n - 1, x]
 
splitBesselI[n_, x_] := BesselI[n, x] -> (x/(2*n))*(BesselI[n - 1, x] - 
       BesselI[n + 1, x])
 
splitBessels[n_, x_] := {splitBesselK[n, x], splitBesselI[n, x]}
 
increaseBessels[n_, x_] := {increaseBesselK[n, x], increaseBesselI[n, x]}
 
decreaseBessels[n_, x_] := {decreaseBesselK[n, x], decreaseBesselI[n, x]}
 
repIncreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, increaseBessels[nList[[K]], x]]]; repList]
 
repDecreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, decreaseBessels[nList[[K]], x]]]; repList]
 
Rearrange[eqn_, var_] := Module[{varCoeff, other, EQN}, 
     EQN = SubtractSides[eqn, eqn[[2]]]; varCoeff = Coefficient[EQN[[1]], 
        var]; other = Simplify[EQN[[1]] - varCoeff*var]; 
      Simplify[-other/varCoeff]]
 
ConvertToMatrixProb[eqns_, unknowns_] := Module[{EQNS, Mat, BVec}, 
     EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
      Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
        {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
      BVec = Simplify[Mat . unknowns - EQNS]; {Mat, BVec}]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
FindUnknowns[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns2[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False]; ); repSol = Table[unknowns[[m]] -> sol[[m]], 
        {m, 1, Length[unknowns]}]; Print[FullSimplify[eqns /. repSol]]; 
      repSol]
 
FindUnknowns3[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns4[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False, Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
createDirectory[relPath_] := Module[{}, SetDirectory[NotebookDirectory[]]; 
      Quiet[CreateDirectory[relPath]]; ]
assums = {Superscript[Subscript[R, 1], 0][t] > 0, 
     Superscript[Subscript[R, 2], 0][t] > 0, 
     Element[Subscript[\[Epsilon], \[Alpha]], Reals], 
     Element[\[CapitalLambda], Reals], \[CapitalLambda] \[NotEqualTilde] 1}
 
increaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n + 2, x] - 
      2*((n + 1)/x)*BesselK[n + 1, x]
 
decreaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n - 2, x] + 
      2*((n - 1)/x)*BesselK[n - 1, x]
 
splitBesselK[n_, x_] := BesselK[n, x] -> (x/(2*n))*(BesselK[n + 1, x] - 
       BesselK[n - 1, x])
 
increaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n + 2, x] + 
      2*((n + 1)/x)*BesselI[n + 1, x]
 
decreaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n - 2, x] - 
      2*((n - 1)/x)*BesselI[n - 1, x]
 
splitBesselI[n_, x_] := BesselI[n, x] -> (x/(2*n))*(BesselI[n - 1, x] - 
       BesselI[n + 1, x])
 
splitBessels[n_, x_] := {splitBesselK[n, x], splitBesselI[n, x]}
 
increaseBessels[n_, x_] := {increaseBesselK[n, x], increaseBesselI[n, x]}
 
decreaseBessels[n_, x_] := {decreaseBesselK[n, x], decreaseBesselI[n, x]}
 
repIncreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, increaseBessels[nList[[K]], x]]]; repList]
 
repDecreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, decreaseBessels[nList[[K]], x]]]; repList]
 
Rearrange[eqn_, var_] := Module[{varCoeff, other, EQN}, 
     EQN = SubtractSides[eqn, eqn[[2]]]; varCoeff = Coefficient[EQN[[1]], 
        var]; other = Simplify[EQN[[1]] - varCoeff*var]; 
      Simplify[-other/varCoeff]]
 
ConvertToMatrixProb[eqns_, unknowns_] := Module[{EQNS, Mat, BVec}, 
     EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
      Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
        {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
      BVec = Simplify[Mat . unknowns - EQNS]; {Mat, BVec}]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
FindUnknowns[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns2[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False]; ); repSol = Table[unknowns[[m]] -> sol[[m]], 
        {m, 1, Length[unknowns]}]; Print[FullSimplify[eqns /. repSol]]; 
      repSol]
 
FindUnknowns3[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns4[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False, Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
findMask[mat_] := Module[{rows, cols}, {rows, cols} = Dimensions[mat]; 
      Table[If[mat[[i,j]] === 0, 0, 1], {i, 1, rows}, {j, 1, cols}]]
 
blockDiagonalise[mat_] := Module[{mask, columnStructure, groups, perm}, 
     mask = findMask[mat]; columnStructure = 
       Table[If[mask[[i,1 ;; All]] == mask[[j,1 ;; All]], 1, 0], 
        {i, 1, Dimensions[mask][[1]]}, {j, 1, Dimensions[mask][[1]]}]; 
      groups = Table[Flatten[Position[columnStructure[[k,1 ;; All]], 1]], 
        {k, 1, Dimensions[columnStructure][[1]]}]; 
      groups = Flatten[Sort[DeleteDuplicates[groups]]]; 
      perm = Table[If[groups[[i]] == j, 1, 0], {i, 1, Length[groups]}, 
        {j, 1, Length[groups]}]; perm]
 
createDirectory[relPath_] := Module[{}, SetDirectory[NotebookDirectory[]]; 
      Quiet[CreateDirectory[relPath]]; ]
assums = {Superscript[Subscript[R, 1], 0][t] > 0, 
     Superscript[Subscript[R, 2], 0][t] > 0, 
     Element[Subscript[\[Epsilon], \[Alpha]], Reals], 
     Element[\[CapitalLambda], Reals], \[CapitalLambda] \[NotEqualTilde] 1}
 
increaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n + 2, x] - 
      2*((n + 1)/x)*BesselK[n + 1, x]
 
decreaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n - 2, x] + 
      2*((n - 1)/x)*BesselK[n - 1, x]
 
splitBesselK[n_, x_] := BesselK[n, x] -> (x/(2*n))*(BesselK[n + 1, x] - 
       BesselK[n - 1, x])
 
increaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n + 2, x] + 
      2*((n + 1)/x)*BesselI[n + 1, x]
 
decreaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n - 2, x] - 
      2*((n - 1)/x)*BesselI[n - 1, x]
 
splitBesselI[n_, x_] := BesselI[n, x] -> (x/(2*n))*(BesselI[n - 1, x] - 
       BesselI[n + 1, x])
 
splitBessels[n_, x_] := {splitBesselK[n, x], splitBesselI[n, x]}
 
increaseBessels[n_, x_] := {increaseBesselK[n, x], increaseBesselI[n, x]}
 
decreaseBessels[n_, x_] := {decreaseBesselK[n, x], decreaseBesselI[n, x]}
 
repIncreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, increaseBessels[nList[[K]], x]]]; repList]
 
repDecreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, decreaseBessels[nList[[K]], x]]]; repList]
 
Rearrange[eqn_, var_] := Module[{varCoeff, other, EQN}, 
     EQN = SubtractSides[eqn, eqn[[2]]]; varCoeff = Coefficient[EQN[[1]], 
        var]; other = Simplify[EQN[[1]] - varCoeff*var]; 
      Simplify[-other/varCoeff]]
 
ConvertToMatrixProb[eqns_, unknowns_] := Module[{EQNS, Mat, BVec}, 
     EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
      Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
        {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
      BVec = Simplify[Mat . unknowns - EQNS]; {Mat, BVec}]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
FindUnknowns[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns2[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False]; ); repSol = Table[unknowns[[m]] -> sol[[m]], 
        {m, 1, Length[unknowns]}]; Print[FullSimplify[eqns /. repSol]]; 
      repSol]
 
FindUnknowns3[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns4[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False, Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
findMask[mat_] := Module[{rows, cols}, {rows, cols} = Dimensions[mat]; 
      Print[rows, cols]; Table[If[mat[[i,j]] === 0, 0, 1], {i, 1, rows}, 
       {j, 1, cols}]]
 
blockDiagonalise[mat_] := Module[{mask, columnStructure, groups, perm}, 
     mask = findMask[mat]; columnStructure = 
       Table[If[mask[[i,1 ;; All]] == mask[[j,1 ;; All]], 1, 0], 
        {i, 1, Dimensions[mask][[1]]}, {j, 1, Dimensions[mask][[1]]}]; 
      groups = Table[Flatten[Position[columnStructure[[k,1 ;; All]], 1]], 
        {k, 1, Dimensions[columnStructure][[1]]}]; 
      groups = Flatten[Sort[DeleteDuplicates[groups]]]; 
      perm = Table[If[groups[[i]] == j, 1, 0], {i, 1, Length[groups]}, 
        {j, 1, Length[groups]}]; perm]
 
createDirectory[relPath_] := Module[{}, SetDirectory[NotebookDirectory[]]; 
      Quiet[CreateDirectory[relPath]]; ]
assums = {Superscript[Subscript[R, 1], 0][t] > 0, 
     Superscript[Subscript[R, 2], 0][t] > 0, 
     Element[Subscript[\[Epsilon], \[Alpha]], Reals], 
     Element[\[CapitalLambda], Reals], \[CapitalLambda] \[NotEqualTilde] 1}
 
increaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n + 2, x] - 
      2*((n + 1)/x)*BesselK[n + 1, x]
 
decreaseBesselK[n_, x_] := BesselK[n, x] -> BesselK[n - 2, x] + 
      2*((n - 1)/x)*BesselK[n - 1, x]
 
splitBesselK[n_, x_] := BesselK[n, x] -> (x/(2*n))*(BesselK[n + 1, x] - 
       BesselK[n - 1, x])
 
increaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n + 2, x] + 
      2*((n + 1)/x)*BesselI[n + 1, x]
 
decreaseBesselI[n_, x_] := BesselI[n, x] -> BesselI[n - 2, x] - 
      2*((n - 1)/x)*BesselI[n - 1, x]
 
splitBesselI[n_, x_] := BesselI[n, x] -> (x/(2*n))*(BesselI[n - 1, x] - 
       BesselI[n + 1, x])
 
splitBessels[n_, x_] := {splitBesselK[n, x], splitBesselI[n, x]}
 
increaseBessels[n_, x_] := {increaseBesselK[n, x], increaseBesselI[n, x]}
 
decreaseBessels[n_, x_] := {decreaseBesselK[n, x], decreaseBesselI[n, x]}
 
repIncreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, increaseBessels[nList[[K]], x]]]; repList]
 
repDecreaseBessels[nList_, x_] := Module[{numOps, repList, K}, 
     numOps = Length[nList]; repList = {}; For[K = 1, K <= numOps, K++, 
       repList = Join[repList, decreaseBessels[nList[[K]], x]]]; repList]
 
Rearrange[eqn_, var_] := Module[{varCoeff, other, EQN}, 
     EQN = SubtractSides[eqn, eqn[[2]]]; varCoeff = Coefficient[EQN[[1]], 
        var]; other = Simplify[EQN[[1]] - varCoeff*var]; 
      Simplify[-other/varCoeff]]
 
ConvertToMatrixProb[eqns_, unknowns_] := Module[{EQNS, Mat, BVec}, 
     EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
      Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
        {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
      BVec = Simplify[Mat . unknowns - EQNS]; {Mat, BVec}]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
FindUnknowns[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns2[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False]; ); repSol = Table[unknowns[[m]] -> sol[[m]], 
        {m, 1, Length[unknowns]}]; Print[FullSimplify[eqns /. repSol]]; 
      repSol]
 
FindUnknowns3[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
FindUnknowns4[eqns_, unknowns_] := Module[{EQNS, Mat, BVec, sol, repSol}, 
     (EQNS = Table[ToLHS[eqns[[n]]][[1]], {n, 1, Length[eqns]}]; 
       Mat = Table[Coefficient[EQNS[[n]], unknowns[[m]]], 
         {n, 1, Length[EQNS]}, {m, 1, Length[unknowns]}]; 
       BVec = Mat . unknowns - EQNS; sol = LinearSolve[Mat, BVec, 
         ZeroTest -> False, Method -> "DivisionFreeRowReduction"]; ); 
      repSol = Table[unknowns[[m]] -> sol[[m]], {m, 1, Length[unknowns]}]; 
      Print[FullSimplify[eqns /. repSol]]; repSol]
 
findMask[mat_] := Module[{rows, cols}, {rows, cols} = Dimensions[mat]; 
      Table[If[mat[[i,j]] === 0, 0, 1], {i, 1, rows}, {j, 1, cols}]]
 
blockDiagonalise[mat_] := Module[{mask, columnStructure, groups, perm}, 
     mask = findMask[mat]; columnStructure = 
       Table[If[mask[[i,1 ;; All]] == mask[[j,1 ;; All]], 1, 0], 
        {i, 1, Dimensions[mask][[1]]}, {j, 1, Dimensions[mask][[1]]}]; 
      groups = Table[Flatten[Position[columnStructure[[k,1 ;; All]], 1]], 
        {k, 1, Dimensions[columnStructure][[1]]}]; 
      groups = Flatten[Sort[DeleteDuplicates[groups]]]; 
      perm = Table[If[groups[[i]] == j, 1, 0], {i, 1, Length[groups]}, 
        {j, 1, Length[groups]}]; perm]
 
createDirectory[relPath_] := Module[{}, SetDirectory[NotebookDirectory[]]; 
      Quiet[CreateDirectory[relPath]]; ]
