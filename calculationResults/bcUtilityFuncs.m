collectTrigList[modes_] := Flatten[Table[{Sin[mode*\[Theta]], 
       Cos[mode*\[Theta]]}, {mode, modes}]]
 
separateConstAndTrigBits[eqn_, modes_] := 
    Module[{terms, trigCoeffs, constBit}, 
     terms = List @@ Collect[ToLHS[eqn][[1]], collectTrigList[modes]]; 
      trigCoeffs = Table[Simplify[Total[Coefficient[terms, term]]], 
        {term, collectTrigList[modes]}]; constBit = 
       {Simplify[Total[terms] - trigCoeffs . collectTrigList[modes]]}; 
      If[constBit == {0}, constBit = {}, 1 + 1]; Join[constBit, trigCoeffs]]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
subbedBCToEqns[eqn_, unknowns_, modeList_] := Module[{terms}, 
     terms = separateConstAndTrigBits[eqn, modeList]; 
      DeleteCases[Table[Collect[term, unknowns] == 0, {term, terms}], True]]
 
convertVelR[velr_, stream_, n_, m_] := (D[velr[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[(1/x)*D[stream[x, y, t], {y, 1}], 
       {x, n}, {y, m}] /. {x -> r, y -> \[Theta]})
 
convertVelT[velt_, stream_, n_, m_] := (D[velt[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[-D[stream[x, y, t], {x, 1}], {x, n}, 
       {y, m}] /. {x -> r, y -> \[Theta]})
 
replaceFunc[func1_, func2_, n_, m_] := (D[func1[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[func2[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]})
 
replaceOrder0Vels[stream_] := 
    Flatten[Table[{convertVelR[Subscript[vr, 0], stream, 0, 0], 
        convertVelT[Subscript[vt, 0], stream, 0, 0], 
        convertVelR[Subscript[vr, 0], stream, 0, 1], 
        convertVelR[Subscript[vr, 0], stream, 1, 0], 
        convertVelT[Subscript[vt, 0], stream, 0, 1], 
        convertVelT[Subscript[vt, 0], stream, 1, 0], 
        convertVelR[Subscript[vr, 0], stream, 1, 1], 
        convertVelT[Subscript[vt, 0], stream, 1, 1], 
        convertVelR[Subscript[vr, 0], stream, 0, 2], 
        convertVelR[Subscript[vr, 0], stream, 2, 0], 
        convertVelT[Subscript[vt, 0], stream, 2, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
vr[r_, \[Theta]_, t_] = Subscript[vr, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vr, 1][r, \[Theta], t]
 
vt[r_, \[Theta]_, t_] = Subscript[vt, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vt, 1][r, \[Theta], t]
 
replaceOrder0Stream[stream_] := 
    Flatten[Table[{replaceFunc[Subscript[\[Psi], 0], stream, 0, 0], 
        replaceFunc[Subscript[\[Psi], 0], stream, 1, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder0Pressures[pressure_] := 
    Flatten[Table[{replaceFunc[Subscript[pOut, 0], pressure, 0, 0], 
        replaceFunc[Subscript[pOut, 0], pressure, 1, 0], 
        replaceFunc[Subscript[pOut, 0], pressure, 0, 1]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
pOut[r_, \[Theta]_, t_] = Subscript[pOut, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[pOut, 1][r, \[Theta], t]
 
replaceOrder0Nematic[trialq1_, trialq2_] := 
    Flatten[Table[{replaceFunc[Subscript[q1, 0], trialq1, 0, 0], 
        replaceFunc[Subscript[q2, 0], trialq2, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
q1[r_, \[Theta]_, t_] = Subscript[q1, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q1, 1][r, \[Theta], t]
 
q2[r_, \[Theta]_, t_] = Subscript[q2, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q2, 1][r, \[Theta], t]
 
replaceOrder1Vels[stream_] := 
    Flatten[Table[{convertVelR[Subscript[vr, 1], stream, 0, 0], 
        convertVelT[Subscript[vt, 1], stream, 0, 0], 
        convertVelR[Subscript[vr, 1], stream, 0, 1], 
        convertVelT[Subscript[vt, 1], stream, 1, 0], 
        convertVelR[Subscript[vr, 1], stream, 1, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder1Stream[stream_] := 
    Flatten[Table[{replaceFunc[Subscript[\[Psi], 1], stream, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder1Pressures[pressure_] := 
    Flatten[Table[{replaceFunc[Subscript[pOut, 1], pressure, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
shapePertFunc[\[Theta]_, t_, k_] = 
    Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], k], 2][t] + 
     Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], k], 4][t] + 
     Superscript[Subscript[\[Xi], k], 0][t] + Cos[2*\[Theta]]*
      Superscript[Subscript[\[Xi], k], 2][t] + Cos[4*\[Theta]]*
      Superscript[Subscript[\[Xi], k], 4][t]
 
replaceOrder1Shape = {Superscript[Subscript[R, 1], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] + 
       Superscript[Subscript[\[Xi], 1], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[0, 1][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      Sin[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 1], 2]][
         t] + Sin[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 1], 
           4]][t] + Derivative[1][Superscript[Subscript[\[Xi], 1], 0]][t] + 
       Cos[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 1], 2]][
         t] + Cos[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 1], 
           4]][t], Superscript[Subscript[R, 1], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] + 
       Superscript[Subscript[\[Xi], 1], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[1, 0][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      2*Cos[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       4*Cos[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] - 
       2*Sin[2*\[Theta]]*Superscript[Subscript[\[Xi], 1], 2][t] - 
       4*Sin[4*\[Theta]]*Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[2, 0][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      -4*Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] - 
       16*Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] - 
       4*Cos[2*\[Theta]]*Superscript[Subscript[\[Xi], 1], 2][t] - 
       16*Cos[4*\[Theta]]*Superscript[Subscript[\[Xi], 1], 4][t], 
     Superscript[Subscript[R, 2], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] + 
       Superscript[Subscript[\[Xi], 2], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[0, 1][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      Sin[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 2], 2]][
         t] + Sin[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 2], 
           4]][t] + Derivative[1][Superscript[Subscript[\[Xi], 2], 0]][t] + 
       Cos[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 2], 2]][
         t] + Cos[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 2], 
           4]][t], Superscript[Subscript[R, 2], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] + 
       Superscript[Subscript[\[Xi], 2], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[1, 0][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      2*Cos[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       4*Cos[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] - 
       2*Sin[2*\[Theta]]*Superscript[Subscript[\[Xi], 2], 2][t] - 
       4*Sin[4*\[Theta]]*Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[2, 0][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      -4*Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] - 
       16*Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] - 
       4*Cos[2*\[Theta]]*Superscript[Subscript[\[Xi], 2], 2][t] - 
       16*Cos[4*\[Theta]]*Superscript[Subscript[\[Xi], 2], 4][t]}
collectTrigList[modes_] := Flatten[Table[{Sin[mode*\[Theta]], 
       Cos[mode*\[Theta]]}, {mode, modes}]]
 
separateConstAndTrigBits[eqn_, modes_] := 
    Module[{terms, trigCoeffs, constBit}, 
     terms = List @@ Collect[ToLHS[eqn][[1]], collectTrigList[modes]]; 
      trigCoeffs = Table[Simplify[Total[Coefficient[terms, term]]], 
        {term, collectTrigList[modes]}]; constBit = 
       {Simplify[Total[terms] - trigCoeffs . collectTrigList[modes]]}; 
      If[constBit == {0}, constBit = {}, 1 + 1]; Join[constBit, trigCoeffs]]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
subbedBCToEqns[eqn_, unknowns_, modeList_] := Module[{terms}, 
     terms = separateConstAndTrigBits[eqn, modeList]; 
      DeleteCases[Table[Collect[term, unknowns] == 0, {term, terms}], True]]
 
convertVelR[velr_, stream_, n_, m_] := (D[velr[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[(1/x)*D[stream[x, y, t], {y, 1}], 
       {x, n}, {y, m}] /. {x -> r, y -> \[Theta]})
 
convertVelT[velt_, stream_, n_, m_] := (D[velt[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[-D[stream[x, y, t], {x, 1}], {x, n}, 
       {y, m}] /. {x -> r, y -> \[Theta]})
 
replaceFunc[func1_, func2_, n_, m_] := (D[func1[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[func2[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]})
 
replaceOrder0Vels[stream_] := 
    Flatten[Table[{convertVelR[Subscript[vr, 0], stream, 0, 0], 
        convertVelT[Subscript[vt, 0], stream, 0, 0], 
        convertVelR[Subscript[vr, 0], stream, 0, 1], 
        convertVelR[Subscript[vr, 0], stream, 1, 0], 
        convertVelT[Subscript[vt, 0], stream, 0, 1], 
        convertVelT[Subscript[vt, 0], stream, 1, 0], 
        convertVelR[Subscript[vr, 0], stream, 1, 1], 
        convertVelT[Subscript[vt, 0], stream, 1, 1], 
        convertVelR[Subscript[vr, 0], stream, 0, 2], 
        convertVelR[Subscript[vr, 0], stream, 2, 0], 
        convertVelT[Subscript[vt, 0], stream, 2, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder0Stream[stream_] := 
    Flatten[Table[{replaceFunc[Subscript[\[Psi], 0], stream, 0, 0], 
        replaceFunc[Subscript[\[Psi], 0], stream, 1, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder0Pressures[pressure_] := 
    Flatten[Table[{replaceFunc[Subscript[pOut, 0], pressure, 0, 0], 
        replaceFunc[Subscript[pOut, 0], pressure, 1, 0], 
        replaceFunc[Subscript[pOut, 0], pressure, 0, 1]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder0Nematic[trialq1_, trialq2_] := 
    Flatten[Table[{replaceFunc[Subscript[q1, 0], trialq1, 0, 0], 
        replaceFunc[Subscript[q2, 0], trialq2, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder1Vels[stream_] := 
    Flatten[Table[{convertVelR[Subscript[vr, 1], stream, 0, 0], 
        convertVelT[Subscript[vt, 1], stream, 0, 0], 
        convertVelR[Subscript[vr, 1], stream, 0, 1], 
        convertVelT[Subscript[vt, 1], stream, 1, 0], 
        convertVelR[Subscript[vr, 1], stream, 1, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder1Stream[stream_] := 
    Flatten[Table[{replaceFunc[Subscript[\[Psi], 1], stream, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder1Pressures[pressure_] := 
    Flatten[Table[{replaceFunc[Subscript[pOut, 1], pressure, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
shapePertFunc[\[Theta]_, t_, k_] = 
    Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], k], 2][t] + 
     Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], k], 4][t] + 
     Superscript[Subscript[\[Xi], k], 0][t] + Cos[2*\[Theta]]*
      Superscript[Subscript[\[Xi], k], 2][t] + Cos[4*\[Theta]]*
      Superscript[Subscript[\[Xi], k], 4][t]
 
replaceOrder1Shape = {Superscript[Subscript[R, 1], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] + 
       Superscript[Subscript[\[Xi], 1], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[0, 1][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      Sin[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 1], 2]][
         t] + Sin[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 1], 
           4]][t] + Derivative[1][Superscript[Subscript[\[Xi], 1], 0]][t] + 
       Cos[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 1], 2]][
         t] + Cos[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 1], 
           4]][t], Superscript[Subscript[R, 1], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] + 
       Superscript[Subscript[\[Xi], 1], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[1, 0][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      2*Cos[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       4*Cos[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] - 
       2*Sin[2*\[Theta]]*Superscript[Subscript[\[Xi], 1], 2][t] - 
       4*Sin[4*\[Theta]]*Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[2, 0][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      -4*Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] - 
       16*Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] - 
       4*Cos[2*\[Theta]]*Superscript[Subscript[\[Xi], 1], 2][t] - 
       16*Cos[4*\[Theta]]*Superscript[Subscript[\[Xi], 1], 4][t], 
     Superscript[Subscript[R, 2], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] + 
       Superscript[Subscript[\[Xi], 2], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[0, 1][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      Sin[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 2], 2]][
         t] + Sin[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 2], 
           4]][t] + Derivative[1][Superscript[Subscript[\[Xi], 2], 0]][t] + 
       Cos[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 2], 2]][
         t] + Cos[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 2], 
           4]][t], Superscript[Subscript[R, 2], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] + 
       Superscript[Subscript[\[Xi], 2], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[1, 0][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      2*Cos[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       4*Cos[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] - 
       2*Sin[2*\[Theta]]*Superscript[Subscript[\[Xi], 2], 2][t] - 
       4*Sin[4*\[Theta]]*Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[2, 0][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      -4*Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] - 
       16*Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] - 
       4*Cos[2*\[Theta]]*Superscript[Subscript[\[Xi], 2], 2][t] - 
       16*Cos[4*\[Theta]]*Superscript[Subscript[\[Xi], 2], 4][t]}
collectTrigList[modes_] := Flatten[Table[{Sin[mode*\[Theta]], 
       Cos[mode*\[Theta]]}, {mode, modes}]]
 
separateConstAndTrigBits[eqn_, modes_] := 
    Module[{terms, trigCoeffs, constBit}, 
     terms = List @@ Collect[ToLHS[eqn][[1]], collectTrigList[modes]]; 
      trigCoeffs = Table[Simplify[Total[Coefficient[terms, term]]], 
        {term, collectTrigList[modes]}]; constBit = 
       {Simplify[Total[terms] - trigCoeffs . collectTrigList[modes]]}; 
      If[constBit == {0}, constBit = {}, 1 + 1]; Join[constBit, trigCoeffs]]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
subbedBCToEqns[eqn_, unknowns_, modeList_] := Module[{terms}, 
     terms = separateConstAndTrigBits[eqn, modeList]; 
      DeleteCases[Table[Collect[term, unknowns] == 0, {term, terms}], True]]
 
convertVelR[velr_, stream_, n_, m_] := (D[velr[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[(1/x)*D[stream[x, y, t], {y, 1}], 
       {x, n}, {y, m}] /. {x -> r, y -> \[Theta]})
 
convertVelT[velt_, stream_, n_, m_] := (D[velt[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[-D[stream[x, y, t], {x, 1}], {x, n}, 
       {y, m}] /. {x -> r, y -> \[Theta]})
 
replaceFunc[func1_, func2_, n_, m_] := (D[func1[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[func2[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]})
 
replaceOrder0Vels[stream_] := 
    Flatten[Table[{convertVelR[Subscript[vr, 0], stream, 0, 0], 
        convertVelT[Subscript[vt, 0], stream, 0, 0], 
        convertVelR[Subscript[vr, 0], stream, 0, 1], 
        convertVelR[Subscript[vr, 0], stream, 1, 0], 
        convertVelT[Subscript[vt, 0], stream, 0, 1], 
        convertVelT[Subscript[vt, 0], stream, 1, 0], 
        convertVelR[Subscript[vr, 0], stream, 1, 1], 
        convertVelT[Subscript[vt, 0], stream, 1, 1], 
        convertVelR[Subscript[vr, 0], stream, 0, 2], 
        convertVelR[Subscript[vr, 0], stream, 2, 0], 
        convertVelT[Subscript[vt, 0], stream, 2, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
vr[r_, \[Theta]_, t_] = Subscript[vr, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vr, 1][r, \[Theta], t]
 
vt[r_, \[Theta]_, t_] = Subscript[vt, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vt, 1][r, \[Theta], t]
 
replaceOrder0Stream[stream_] := 
    Flatten[Table[{replaceFunc[Subscript[\[Psi], 0], stream, 0, 0], 
        replaceFunc[Subscript[\[Psi], 0], stream, 1, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder0Pressures[pressure_] := 
    Flatten[Table[{replaceFunc[Subscript[pOut, 0], pressure, 0, 0], 
        replaceFunc[Subscript[pOut, 0], pressure, 1, 0], 
        replaceFunc[Subscript[pOut, 0], pressure, 0, 1]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
pOut[r_, \[Theta]_, t_] = Subscript[pOut, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[pOut, 1][r, \[Theta], t]
 
replaceOrder0Nematic[trialq1_, trialq2_] := 
    Flatten[Table[{replaceFunc[Subscript[q1, 0], trialq1, 0, 0], 
        replaceFunc[Subscript[q2, 0], trialq2, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
q1[r_, \[Theta]_, t_] = Subscript[q1, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q1, 1][r, \[Theta], t]
 
q2[r_, \[Theta]_, t_] = Subscript[q2, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q2, 1][r, \[Theta], t]
 
replaceOrder1Vels[stream_] := 
    Flatten[Table[{convertVelR[Subscript[vr, 1], stream, 0, 0], 
        convertVelT[Subscript[vt, 1], stream, 0, 0], 
        convertVelR[Subscript[vr, 1], stream, 0, 1], 
        convertVelT[Subscript[vt, 1], stream, 1, 0], 
        convertVelR[Subscript[vr, 1], stream, 1, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder1Stream[stream_] := 
    Flatten[Table[{replaceFunc[Subscript[\[Psi], 1], stream, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder1Pressures[pressure_] := 
    Flatten[Table[{replaceFunc[Subscript[pOut, 1], pressure, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
shapePertFunc[\[Theta]_, t_, k_] = 
    Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], k], 2][t] + 
     Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], k], 4][t] + 
     Superscript[Subscript[\[Xi], k], 0][t] + Cos[2*\[Theta]]*
      Superscript[Subscript[\[Xi], k], 2][t] + Cos[4*\[Theta]]*
      Superscript[Subscript[\[Xi], k], 4][t]
 
replaceOrder1Shape = {Superscript[Subscript[R, 1], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] + 
       Superscript[Subscript[\[Xi], 1], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[0, 1][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      Sin[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 1], 2]][
         t] + Sin[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 1], 
           4]][t] + Derivative[1][Superscript[Subscript[\[Xi], 1], 0]][t] + 
       Cos[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 1], 2]][
         t] + Cos[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 1], 
           4]][t], Superscript[Subscript[R, 1], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] + 
       Superscript[Subscript[\[Xi], 1], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[1, 0][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      2*Cos[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       4*Cos[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] - 
       2*Sin[2*\[Theta]]*Superscript[Subscript[\[Xi], 1], 2][t] - 
       4*Sin[4*\[Theta]]*Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[2, 0][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      -4*Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] - 
       16*Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] - 
       4*Cos[2*\[Theta]]*Superscript[Subscript[\[Xi], 1], 2][t] - 
       16*Cos[4*\[Theta]]*Superscript[Subscript[\[Xi], 1], 4][t], 
     Superscript[Subscript[R, 2], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] + 
       Superscript[Subscript[\[Xi], 2], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[0, 1][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      Sin[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 2], 2]][
         t] + Sin[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 2], 
           4]][t] + Derivative[1][Superscript[Subscript[\[Xi], 2], 0]][t] + 
       Cos[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 2], 2]][
         t] + Cos[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 2], 
           4]][t], Superscript[Subscript[R, 2], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] + 
       Superscript[Subscript[\[Xi], 2], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[1, 0][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      2*Cos[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       4*Cos[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] - 
       2*Sin[2*\[Theta]]*Superscript[Subscript[\[Xi], 2], 2][t] - 
       4*Sin[4*\[Theta]]*Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[2, 0][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      -4*Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] - 
       16*Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] - 
       4*Cos[2*\[Theta]]*Superscript[Subscript[\[Xi], 2], 2][t] - 
       16*Cos[4*\[Theta]]*Superscript[Subscript[\[Xi], 2], 4][t]}
collectTrigList[modes_] := Flatten[Table[{Sin[mode*\[Theta]], 
       Cos[mode*\[Theta]]}, {mode, modes}]]
 
separateConstAndTrigBits[eqn_, modes_] := 
    Module[{terms, trigCoeffs, constBit}, 
     terms = List @@ Collect[ToLHS[eqn][[1]], collectTrigList[modes]]; 
      trigCoeffs = Table[Simplify[Total[Coefficient[terms, term]]], 
        {term, collectTrigList[modes]}]; constBit = 
       {Simplify[Total[terms] - trigCoeffs . collectTrigList[modes]]}; 
      If[constBit == {0}, constBit = {}, 1 + 1]; Join[constBit, trigCoeffs]]
 
ToLHS[eqn_] := Module[{}, SubtractSides[eqn, eqn[[2]]]]
 
subbedBCToEqns[eqn_, unknowns_, modeList_] := Module[{terms}, 
     terms = separateConstAndTrigBits[eqn, modeList]; 
      DeleteCases[Table[Collect[term, unknowns] == 0, {term, terms}], True]]
 
convertVelR[velr_, stream_, n_, m_] := (D[velr[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[(1/x)*D[stream[x, y, t], {y, 1}], 
       {x, n}, {y, m}] /. {x -> r, y -> \[Theta]})
 
convertVelT[velt_, stream_, n_, m_] := (D[velt[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[-D[stream[x, y, t], {x, 1}], {x, n}, 
       {y, m}] /. {x -> r, y -> \[Theta]})
 
replaceFunc[func1_, func2_, n_, m_] := (D[func1[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]}) -> (D[func2[x, y, t], {x, n}, {y, m}] /. 
      {x -> r, y -> \[Theta]})
 
replaceOrder0Vels[stream_] := 
    Flatten[Table[{convertVelR[Subscript[vr, 0], stream, 0, 0], 
        convertVelT[Subscript[vt, 0], stream, 0, 0], 
        convertVelR[Subscript[vr, 0], stream, 0, 1], 
        convertVelR[Subscript[vr, 0], stream, 1, 0], 
        convertVelT[Subscript[vt, 0], stream, 0, 1], 
        convertVelT[Subscript[vt, 0], stream, 1, 0], 
        convertVelR[Subscript[vr, 0], stream, 1, 1], 
        convertVelT[Subscript[vt, 0], stream, 1, 1], 
        convertVelR[Subscript[vr, 0], stream, 0, 2], 
        convertVelR[Subscript[vr, 0], stream, 2, 0], 
        convertVelT[Subscript[vt, 0], stream, 2, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
vr[r_, \[Theta]_, t_] = Subscript[vr, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vr, 1][r, \[Theta], t]
 
vt[r_, \[Theta]_, t_] = Subscript[vt, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vt, 1][r, \[Theta], t]
 
replaceOrder0Stream[stream_] := 
    Flatten[Table[{replaceFunc[Subscript[\[Psi], 0], stream, 0, 0], 
        replaceFunc[Subscript[\[Psi], 0], stream, 1, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder0Pressures[pressure_] := 
    Flatten[Table[{replaceFunc[Subscript[pOut, 0], pressure, 0, 0], 
        replaceFunc[Subscript[pOut, 0], pressure, 1, 0], 
        replaceFunc[Subscript[pOut, 0], pressure, 0, 1]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
pOut[r_, \[Theta]_, t_] = Subscript[pOut, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[pOut, 1][r, \[Theta], t]
 
replaceOrder0Nematic[trialq1_, trialq2_] := 
    Flatten[Table[{replaceFunc[Subscript[q1, 0], trialq1, 0, 0], 
        replaceFunc[Subscript[q2, 0], trialq2, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
q1[r_, \[Theta]_, t_] = Subscript[q1, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q1, 1][r, \[Theta], t]
 
q2[r_, \[Theta]_, t_] = Subscript[q2, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q2, 1][r, \[Theta], t]
 
replaceOrder1Vels[stream_] := 
    Flatten[Table[{convertVelR[Subscript[vr, 1], stream, 0, 0], 
        convertVelT[Subscript[vt, 1], stream, 0, 0], 
        convertVelR[Subscript[vr, 1], stream, 0, 1], 
        convertVelT[Subscript[vt, 1], stream, 1, 0], 
        convertVelR[Subscript[vr, 1], stream, 1, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder1Stream[stream_] := 
    Flatten[Table[{replaceFunc[Subscript[\[Psi], 1], stream, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
replaceOrder1Pressures[pressure_] := 
    Flatten[Table[{replaceFunc[Subscript[pOut, 1], pressure, 0, 0]} /. 
       {r -> Superscript[Subscript[R, k], 0][t]}, {k, {1, 2}}]]
 
shapePertFunc[\[Theta]_, t_, k_] = 
    Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], k], 2][t] + 
     Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], k], 4][t] + 
     Superscript[Subscript[\[Xi], k], 0][t] + Cos[2*\[Theta]]*
      Superscript[Subscript[\[Xi], k], 2][t] + Cos[4*\[Theta]]*
      Superscript[Subscript[\[Xi], k], 4][t]
 
replaceOrder1Shape = {Superscript[Subscript[R, 1], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] + 
       Superscript[Subscript[\[Xi], 1], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[0, 1][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      Sin[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 1], 2]][
         t] + Sin[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 1], 
           4]][t] + Derivative[1][Superscript[Subscript[\[Xi], 1], 0]][t] + 
       Cos[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 1], 2]][
         t] + Cos[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 1], 
           4]][t], Superscript[Subscript[R, 1], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] + 
       Superscript[Subscript[\[Xi], 1], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[1, 0][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      2*Cos[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] + 
       4*Cos[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] - 
       2*Sin[2*\[Theta]]*Superscript[Subscript[\[Xi], 1], 2][t] - 
       4*Sin[4*\[Theta]]*Superscript[Subscript[\[Xi], 1], 4][t], 
     Derivative[2, 0][Superscript[Subscript[R, 1], 1]][\[Theta], t] -> 
      -4*Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 1], 2][t] - 
       16*Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 1], 4][t] - 
       4*Cos[2*\[Theta]]*Superscript[Subscript[\[Xi], 1], 2][t] - 
       16*Cos[4*\[Theta]]*Superscript[Subscript[\[Xi], 1], 4][t], 
     Superscript[Subscript[R, 2], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] + 
       Superscript[Subscript[\[Xi], 2], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[0, 1][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      Sin[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 2], 2]][
         t] + Sin[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Eta], 2], 
           4]][t] + Derivative[1][Superscript[Subscript[\[Xi], 2], 0]][t] + 
       Cos[2*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 2], 2]][
         t] + Cos[4*\[Theta]]*Derivative[1][Superscript[Subscript[\[Xi], 2], 
           4]][t], Superscript[Subscript[R, 2], 1][\[Theta], t] -> 
      Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] + 
       Superscript[Subscript[\[Xi], 2], 0][t] + Cos[2*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 2][t] + Cos[4*\[Theta]]*
        Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[1, 0][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      2*Cos[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] + 
       4*Cos[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] - 
       2*Sin[2*\[Theta]]*Superscript[Subscript[\[Xi], 2], 2][t] - 
       4*Sin[4*\[Theta]]*Superscript[Subscript[\[Xi], 2], 4][t], 
     Derivative[2, 0][Superscript[Subscript[R, 2], 1]][\[Theta], t] -> 
      -4*Sin[2*\[Theta]]*Superscript[Subscript[\[Eta], 2], 2][t] - 
       16*Sin[4*\[Theta]]*Superscript[Subscript[\[Eta], 2], 4][t] - 
       4*Cos[2*\[Theta]]*Superscript[Subscript[\[Xi], 2], 2][t] - 
       16*Cos[4*\[Theta]]*Superscript[Subscript[\[Xi], 2], 4][t]}
