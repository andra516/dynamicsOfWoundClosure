nematicUnknowns = {Subscript[a, 0], Subscript[b, 0], Subscript[e, 0], 
     Subscript[f, 0], Subscript[a, 2], Subscript[b, 2], Subscript[c, 2], 
     Subscript[d, 2], Subscript[e, 2], Subscript[f, 2], Subscript[g, 2], 
     Subscript[h, 2]}
 
nematic0SolCoeffs = {Subscript[a, 0] -> 0, Subscript[b, 0] -> 0, 
     Subscript[e, 0] -> (BesselI[0, \[CapitalLambda]*
          Superscript[Subscript[R, 1], 0][t]] - BesselI[0, 
         \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[f, 0] -> 
      (-BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[a, 2] -> 0, Subscript[b, 2] -> 
      (Subscript[\[Beta], 1]*Superscript[Subscript[R, 1], 0][t]^2*
        Superscript[Subscript[R, 2], 0][t]^4)/
       (Superscript[Subscript[R, 1], 0][t]^4 - 
        Superscript[Subscript[R, 2], 0][t]^4), Subscript[c, 2] -> 0, 
     Subscript[d, 2] -> -((Subscript[\[Beta], 1]*
         Superscript[Subscript[R, 1], 0][t]^2)/
        (Superscript[Subscript[R, 1], 0][t]^4 - 
         Superscript[Subscript[R, 2], 0][t]^4)), Subscript[e, 2] -> 
      -((BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         Subscript[\[Beta], 1])/(BesselI[2, \[CapitalLambda]*
            Superscript[Subscript[R, 2], 0][t]]*BesselK[2, 
           \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
         BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
          BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]])), 
     Subscript[f, 2] -> 0, Subscript[g, 2] -> 
      (BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
        Subscript[\[Beta], 1])/
       (BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[h, 2] -> 0}
 
q1Sol0[r_, \[Theta]_, t_] = BesselK[0, r*\[CapitalLambda]]*Subscript[e, 0] + 
     BesselK[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[e, 2] + 
     BesselI[0, r*\[CapitalLambda]]*Subscript[f, 0] + 
     BesselI[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[g, 2]
 
q2Sol0[r_, \[Theta]_, t_] = (Sin[2*\[Theta]]*Subscript[b, 2])/r^2 + 
     r^2*Sin[2*\[Theta]]*Subscript[d, 2]
 
divQ0[r_, \[Theta]_, t_] = {2*r*Subscript[d, 2] - 
      (\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
      \[CapitalLambda]*Cos[2*\[Theta]]*(BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - BesselI[1, r*\[CapitalLambda]]*Subscript[f, 0]) + 
      (\[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*Subscript[g, 2])/2 + 
      Cos[4*\[Theta]]*((2*Subscript[b, 2])/r^3 - 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 + 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2), 
     Sin[2*\[Theta]]*(\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - \[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*
         Subscript[f, 0]) + Sin[4*\[Theta]]*((-2*Subscript[b, 2])/r^3 + 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2)}
 
curlDivQ0 = -(\[CapitalLambda]^2*Sin[2*\[Theta]]*
       (BesselK[2, r*\[CapitalLambda]]*Subscript[e, 0] + 
        BesselI[2, r*\[CapitalLambda]]*Subscript[f, 0])) + 
     (Sin[4*\[Theta]]*((24*Subscript[b, 2])/r^4 - \[CapitalLambda]^2*
         (BesselK[4, r*\[CapitalLambda]]*Subscript[e, 2] + 
          BesselI[4, r*\[CapitalLambda]]*Subscript[g, 2])))/2
nematicUnknowns = {Subscript[a, 0], Subscript[b, 0], Subscript[e, 0], 
     Subscript[f, 0], Subscript[a, 2], Subscript[b, 2], Subscript[c, 2], 
     Subscript[d, 2], Subscript[e, 2], Subscript[f, 2], Subscript[g, 2], 
     Subscript[h, 2]}
 
nematic0SolCoeffs = {Subscript[a, 0] -> 0, Subscript[b, 0] -> 0, 
     Subscript[e, 0] -> (BesselI[0, \[CapitalLambda]*
          Superscript[Subscript[R, 1], 0][t]] - BesselI[0, 
         \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[f, 0] -> 
      (-BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[a, 2] -> 0, Subscript[b, 2] -> 
      (Subscript[\[Beta], 1]*Superscript[Subscript[R, 1], 0][t]^2*
        Superscript[Subscript[R, 2], 0][t]^4)/
       (Superscript[Subscript[R, 1], 0][t]^4 - 
        Superscript[Subscript[R, 2], 0][t]^4), Subscript[c, 2] -> 0, 
     Subscript[d, 2] -> -((Subscript[\[Beta], 1]*
         Superscript[Subscript[R, 1], 0][t]^2)/
        (Superscript[Subscript[R, 1], 0][t]^4 - 
         Superscript[Subscript[R, 2], 0][t]^4)), Subscript[e, 2] -> 
      -((BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         Subscript[\[Beta], 1])/(BesselI[2, \[CapitalLambda]*
            Superscript[Subscript[R, 2], 0][t]]*BesselK[2, 
           \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
         BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
          BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]])), 
     Subscript[f, 2] -> 0, Subscript[g, 2] -> 
      (BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
        Subscript[\[Beta], 1])/
       (BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[h, 2] -> 0}
 
q1Sol0[r_, \[Theta]_, t_] = BesselK[0, r*\[CapitalLambda]]*Subscript[e, 0] + 
     BesselK[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[e, 2] + 
     BesselI[0, r*\[CapitalLambda]]*Subscript[f, 0] + 
     BesselI[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[g, 2]
 
q2Sol0[r_, \[Theta]_, t_] = (Sin[2*\[Theta]]*Subscript[b, 2])/r^2 + 
     r^2*Sin[2*\[Theta]]*Subscript[d, 2]
 
divQ0[r_, \[Theta]_, t_] = {2*r*Subscript[d, 2] - 
      (\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
      \[CapitalLambda]*Cos[2*\[Theta]]*(BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - BesselI[1, r*\[CapitalLambda]]*Subscript[f, 0]) + 
      (\[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*Subscript[g, 2])/2 + 
      Cos[4*\[Theta]]*((2*Subscript[b, 2])/r^3 - 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 + 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2), 
     Sin[2*\[Theta]]*(\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - \[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*
         Subscript[f, 0]) + Sin[4*\[Theta]]*((-2*Subscript[b, 2])/r^3 + 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2)}
 
curlDivQ0 = -(\[CapitalLambda]^2*Sin[2*\[Theta]]*
       (BesselK[2, r*\[CapitalLambda]]*Subscript[e, 0] + 
        BesselI[2, r*\[CapitalLambda]]*Subscript[f, 0])) + 
     (Sin[4*\[Theta]]*((24*Subscript[b, 2])/r^4 - \[CapitalLambda]^2*
         (BesselK[4, r*\[CapitalLambda]]*Subscript[e, 2] + 
          BesselI[4, r*\[CapitalLambda]]*Subscript[g, 2])))/2
nematicUnknowns = {Subscript[a, 0], Subscript[b, 0], Subscript[e, 0], 
     Subscript[f, 0], Subscript[a, 2], Subscript[b, 2], Subscript[c, 2], 
     Subscript[d, 2], Subscript[e, 2], Subscript[f, 2], Subscript[g, 2], 
     Subscript[h, 2]}
 
nematic0SolCoeffs = {Subscript[a, 0] -> 0, Subscript[b, 0] -> 0, 
     Subscript[e, 0] -> (BesselI[0, \[CapitalLambda]*
          Superscript[Subscript[R, 1], 0][t]] - BesselI[0, 
         \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[f, 0] -> 
      (-BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[a, 2] -> 0, Subscript[b, 2] -> 
      (Subscript[\[Beta], 1]*Superscript[Subscript[R, 1], 0][t]^2*
        Superscript[Subscript[R, 2], 0][t]^4)/
       (Superscript[Subscript[R, 1], 0][t]^4 - 
        Superscript[Subscript[R, 2], 0][t]^4), Subscript[c, 2] -> 0, 
     Subscript[d, 2] -> -((Subscript[\[Beta], 1]*
         Superscript[Subscript[R, 1], 0][t]^2)/
        (Superscript[Subscript[R, 1], 0][t]^4 - 
         Superscript[Subscript[R, 2], 0][t]^4)), Subscript[e, 2] -> 
      -((BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         Subscript[\[Beta], 1])/(BesselI[2, \[CapitalLambda]*
            Superscript[Subscript[R, 2], 0][t]]*BesselK[2, 
           \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
         BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
          BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]])), 
     Subscript[f, 2] -> 0, Subscript[g, 2] -> 
      (BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
        Subscript[\[Beta], 1])/
       (BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[h, 2] -> 0}
 
q1Sol0[r_, \[Theta]_, t_] = BesselK[0, r*\[CapitalLambda]]*Subscript[e, 0] + 
     BesselK[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[e, 2] + 
     BesselI[0, r*\[CapitalLambda]]*Subscript[f, 0] + 
     BesselI[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[g, 2]
 
q2Sol0[r_, \[Theta]_, t_] = (Sin[2*\[Theta]]*Subscript[b, 2])/r^2 + 
     r^2*Sin[2*\[Theta]]*Subscript[d, 2]
 
divQ0[r_, \[Theta]_, t_] = {2*r*Subscript[d, 2] - 
      (\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
      \[CapitalLambda]*Cos[2*\[Theta]]*(BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - BesselI[1, r*\[CapitalLambda]]*Subscript[f, 0]) + 
      (\[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*Subscript[g, 2])/2 + 
      Cos[4*\[Theta]]*((2*Subscript[b, 2])/r^3 - 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 + 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2), 
     Sin[2*\[Theta]]*(\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - \[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*
         Subscript[f, 0]) + Sin[4*\[Theta]]*((-2*Subscript[b, 2])/r^3 + 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2)}
 
curlDivQ0 = -(\[CapitalLambda]^2*Sin[2*\[Theta]]*
       (BesselK[2, r*\[CapitalLambda]]*Subscript[e, 0] + 
        BesselI[2, r*\[CapitalLambda]]*Subscript[f, 0])) + 
     (Sin[4*\[Theta]]*((24*Subscript[b, 2])/r^4 - \[CapitalLambda]^2*
         (BesselK[4, r*\[CapitalLambda]]*Subscript[e, 2] + 
          BesselI[4, r*\[CapitalLambda]]*Subscript[g, 2])))/2
nematicUnknowns = {Subscript[a, 0], Subscript[b, 0], Subscript[e, 0], 
     Subscript[f, 0], Subscript[a, 2], Subscript[b, 2], Subscript[c, 2], 
     Subscript[d, 2], Subscript[e, 2], Subscript[f, 2], Subscript[g, 2], 
     Subscript[h, 2]}
 
nematic0SolCoeffs = {Subscript[a, 0] -> 0, Subscript[b, 0] -> 0, 
     Subscript[e, 0] -> (BesselI[0, \[CapitalLambda]*
          Superscript[Subscript[R, 1], 0][t]] - BesselI[0, 
         \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[f, 0] -> 
      (-BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[a, 2] -> 0, Subscript[b, 2] -> 
      (Subscript[\[Beta], 1]*Superscript[Subscript[R, 1], 0][t]^2*
        Superscript[Subscript[R, 2], 0][t]^4)/
       (Superscript[Subscript[R, 1], 0][t]^4 - 
        Superscript[Subscript[R, 2], 0][t]^4), Subscript[c, 2] -> 0, 
     Subscript[d, 2] -> -((Subscript[\[Beta], 1]*
         Superscript[Subscript[R, 1], 0][t]^2)/
        (Superscript[Subscript[R, 1], 0][t]^4 - 
         Superscript[Subscript[R, 2], 0][t]^4)), Subscript[e, 2] -> 
      -((BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         Subscript[\[Beta], 1])/(BesselI[2, \[CapitalLambda]*
            Superscript[Subscript[R, 2], 0][t]]*BesselK[2, 
           \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
         BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
          BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]])), 
     Subscript[f, 2] -> 0, Subscript[g, 2] -> 
      (BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
        Subscript[\[Beta], 1])/
       (BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[h, 2] -> 0}
 
q1Sol0[r_, \[Theta]_, t_] = BesselK[0, r*\[CapitalLambda]]*Subscript[e, 0] + 
     BesselK[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[e, 2] + 
     BesselI[0, r*\[CapitalLambda]]*Subscript[f, 0] + 
     BesselI[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[g, 2]
 
q2Sol0[r_, \[Theta]_, t_] = (Sin[2*\[Theta]]*Subscript[b, 2])/r^2 + 
     r^2*Sin[2*\[Theta]]*Subscript[d, 2]
 
divQ0[r_, \[Theta]_, t_] = {2*r*Subscript[d, 2] - 
      (\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
      \[CapitalLambda]*Cos[2*\[Theta]]*(BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - BesselI[1, r*\[CapitalLambda]]*Subscript[f, 0]) + 
      (\[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*Subscript[g, 2])/2 + 
      Cos[4*\[Theta]]*((2*Subscript[b, 2])/r^3 - 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 + 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2), 
     Sin[2*\[Theta]]*(\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - \[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*
         Subscript[f, 0]) + Sin[4*\[Theta]]*((-2*Subscript[b, 2])/r^3 + 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2)}
 
curlDivQ0 = -(\[CapitalLambda]^2*Sin[2*\[Theta]]*
       (BesselK[2, r*\[CapitalLambda]]*Subscript[e, 0] + 
        BesselI[2, r*\[CapitalLambda]]*Subscript[f, 0])) + 
     (Sin[4*\[Theta]]*((24*Subscript[b, 2])/r^4 - \[CapitalLambda]^2*
         (BesselK[4, r*\[CapitalLambda]]*Subscript[e, 2] + 
          BesselI[4, r*\[CapitalLambda]]*Subscript[g, 2])))/2
nematicUnknowns = {Subscript[a, 0], Subscript[b, 0], Subscript[e, 0], 
     Subscript[f, 0], Subscript[a, 2], Subscript[b, 2], Subscript[c, 2], 
     Subscript[d, 2], Subscript[e, 2], Subscript[f, 2], Subscript[g, 2], 
     Subscript[h, 2]}
 
nematic0SolCoeffs = {Subscript[a, 0] -> 0, Subscript[b, 0] -> 0, 
     Subscript[e, 0] -> (BesselI[0, \[CapitalLambda]*
          Superscript[Subscript[R, 1], 0][t]] - BesselI[0, 
         \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[f, 0] -> 
      (-BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[a, 2] -> 0, Subscript[b, 2] -> 
      (Subscript[\[Beta], 1]*Superscript[Subscript[R, 1], 0][t]^2*
        Superscript[Subscript[R, 2], 0][t]^4)/
       (Superscript[Subscript[R, 1], 0][t]^4 - 
        Superscript[Subscript[R, 2], 0][t]^4), Subscript[c, 2] -> 0, 
     Subscript[d, 2] -> -((Subscript[\[Beta], 1]*
         Superscript[Subscript[R, 1], 0][t]^2)/
        (Superscript[Subscript[R, 1], 0][t]^4 - 
         Superscript[Subscript[R, 2], 0][t]^4)), Subscript[e, 2] -> 
      -((BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         Subscript[\[Beta], 1])/(BesselI[2, \[CapitalLambda]*
            Superscript[Subscript[R, 2], 0][t]]*BesselK[2, 
           \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
         BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
          BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]])), 
     Subscript[f, 2] -> 0, Subscript[g, 2] -> 
      (BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
        Subscript[\[Beta], 1])/
       (BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[h, 2] -> 0}
 
q1Sol0[r_, \[Theta]_, t_] = BesselK[0, r*\[CapitalLambda]]*Subscript[e, 0] + 
     BesselK[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[e, 2] + 
     BesselI[0, r*\[CapitalLambda]]*Subscript[f, 0] + 
     BesselI[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[g, 2]
 
q2Sol0[r_, \[Theta]_, t_] = (Sin[2*\[Theta]]*Subscript[b, 2])/r^2 + 
     r^2*Sin[2*\[Theta]]*Subscript[d, 2]
 
divQ0[r_, \[Theta]_, t_] = {2*r*Subscript[d, 2] - 
      (\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
      \[CapitalLambda]*Cos[2*\[Theta]]*(BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - BesselI[1, r*\[CapitalLambda]]*Subscript[f, 0]) + 
      (\[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*Subscript[g, 2])/2 + 
      Cos[4*\[Theta]]*((2*Subscript[b, 2])/r^3 - 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 + 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2), 
     Sin[2*\[Theta]]*(\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - \[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*
         Subscript[f, 0]) + Sin[4*\[Theta]]*((-2*Subscript[b, 2])/r^3 + 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2)}
 
curlDivQ0 = -(\[CapitalLambda]^2*Sin[2*\[Theta]]*
       (BesselK[2, r*\[CapitalLambda]]*Subscript[e, 0] + 
        BesselI[2, r*\[CapitalLambda]]*Subscript[f, 0])) + 
     (Sin[4*\[Theta]]*((24*Subscript[b, 2])/r^4 - \[CapitalLambda]^2*
         (BesselK[4, r*\[CapitalLambda]]*Subscript[e, 2] + 
          BesselI[4, r*\[CapitalLambda]]*Subscript[g, 2])))/2
nematicUnknowns = {Subscript[a, 0], Subscript[b, 0], Subscript[e, 0], 
     Subscript[f, 0], Subscript[a, 2], Subscript[b, 2], Subscript[c, 2], 
     Subscript[d, 2], Subscript[e, 2], Subscript[f, 2], Subscript[g, 2], 
     Subscript[h, 2]}
 
nematic0SolCoeffs = {Subscript[a, 0] -> 0, Subscript[b, 0] -> 0, 
     Subscript[e, 0] -> (BesselI[0, \[CapitalLambda]*
          Superscript[Subscript[R, 1], 0][t]] - BesselI[0, 
         \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[f, 0] -> 
      (-BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[a, 2] -> 0, Subscript[b, 2] -> 
      (Subscript[\[Beta], 1]*Superscript[Subscript[R, 1], 0][t]^2*
        Superscript[Subscript[R, 2], 0][t]^4)/
       (Superscript[Subscript[R, 1], 0][t]^4 - 
        Superscript[Subscript[R, 2], 0][t]^4), Subscript[c, 2] -> 0, 
     Subscript[d, 2] -> -((Subscript[\[Beta], 1]*
         Superscript[Subscript[R, 1], 0][t]^2)/
        (Superscript[Subscript[R, 1], 0][t]^4 - 
         Superscript[Subscript[R, 2], 0][t]^4)), Subscript[e, 2] -> 
      -((BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         Subscript[\[Beta], 1])/(BesselI[2, \[CapitalLambda]*
            Superscript[Subscript[R, 2], 0][t]]*BesselK[2, 
           \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
         BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
          BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]])), 
     Subscript[f, 2] -> 0, Subscript[g, 2] -> 
      (BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
        Subscript[\[Beta], 1])/
       (BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[h, 2] -> 0}
 
q1Sol0[r_, \[Theta]_, t_] = BesselK[0, r*\[CapitalLambda]]*Subscript[e, 0] + 
     BesselK[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[e, 2] + 
     BesselI[0, r*\[CapitalLambda]]*Subscript[f, 0] + 
     BesselI[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[g, 2]
 
q2Sol0[r_, \[Theta]_, t_] = (Sin[2*\[Theta]]*Subscript[b, 2])/r^2 + 
     r^2*Sin[2*\[Theta]]*Subscript[d, 2]
 
divQ0[r_, \[Theta]_, t_] = {2*r*Subscript[d, 2] - 
      (\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
      \[CapitalLambda]*Cos[2*\[Theta]]*(BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - BesselI[1, r*\[CapitalLambda]]*Subscript[f, 0]) + 
      (\[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*Subscript[g, 2])/2 + 
      Cos[4*\[Theta]]*((2*Subscript[b, 2])/r^3 - 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 + 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2), 
     Sin[2*\[Theta]]*(\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - \[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*
         Subscript[f, 0]) + Sin[4*\[Theta]]*((-2*Subscript[b, 2])/r^3 + 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2)}
 
curlDivQ0 = -(\[CapitalLambda]^2*Sin[2*\[Theta]]*
       (BesselK[2, r*\[CapitalLambda]]*Subscript[e, 0] + 
        BesselI[2, r*\[CapitalLambda]]*Subscript[f, 0])) + 
     (Sin[4*\[Theta]]*((24*Subscript[b, 2])/r^4 - \[CapitalLambda]^2*
         (BesselK[4, r*\[CapitalLambda]]*Subscript[e, 2] + 
          BesselI[4, r*\[CapitalLambda]]*Subscript[g, 2])))/2
nematicUnknowns = {Subscript[a, 0], Subscript[b, 0], Subscript[e, 0], 
     Subscript[f, 0], Subscript[a, 2], Subscript[b, 2], Subscript[c, 2], 
     Subscript[d, 2], Subscript[e, 2], Subscript[f, 2], Subscript[g, 2], 
     Subscript[h, 2]}
 
nematic0SolCoeffs = {Subscript[a, 0] -> 0, Subscript[b, 0] -> 0, 
     Subscript[e, 0] -> (BesselI[0, \[CapitalLambda]*
          Superscript[Subscript[R, 1], 0][t]] - BesselI[0, 
         \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[f, 0] -> 
      (-BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]] + 
        BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         Subscript[\[Beta], 2])/
       (BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[0, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[0, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[a, 2] -> 0, Subscript[b, 2] -> 
      (Subscript[\[Beta], 1]*Superscript[Subscript[R, 1], 0][t]^2*
        Superscript[Subscript[R, 2], 0][t]^4)/
       (Superscript[Subscript[R, 1], 0][t]^4 - 
        Superscript[Subscript[R, 2], 0][t]^4), Subscript[c, 2] -> 0, 
     Subscript[d, 2] -> -((Subscript[\[Beta], 1]*
         Superscript[Subscript[R, 1], 0][t]^2)/
        (Superscript[Subscript[R, 1], 0][t]^4 - 
         Superscript[Subscript[R, 2], 0][t]^4)), Subscript[e, 2] -> 
      -((BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         Subscript[\[Beta], 1])/(BesselI[2, \[CapitalLambda]*
            Superscript[Subscript[R, 2], 0][t]]*BesselK[2, 
           \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
         BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
          BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]])), 
     Subscript[f, 2] -> 0, Subscript[g, 2] -> 
      (BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
        Subscript[\[Beta], 1])/
       (BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]] - 
        BesselI[2, \[CapitalLambda]*Superscript[Subscript[R, 1], 0][t]]*
         BesselK[2, \[CapitalLambda]*Superscript[Subscript[R, 2], 0][t]]), 
     Subscript[h, 2] -> 0}
 
q1Sol0[r_, \[Theta]_, t_] = BesselK[0, r*\[CapitalLambda]]*Subscript[e, 0] + 
     BesselK[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[e, 2] + 
     BesselI[0, r*\[CapitalLambda]]*Subscript[f, 0] + 
     BesselI[2, r*\[CapitalLambda]]*Cos[2*\[Theta]]*Subscript[g, 2]
 
q2Sol0[r_, \[Theta]_, t_] = (Sin[2*\[Theta]]*Subscript[b, 2])/r^2 + 
     r^2*Sin[2*\[Theta]]*Subscript[d, 2]
 
divQ0[r_, \[Theta]_, t_] = {2*r*Subscript[d, 2] - 
      (\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
      \[CapitalLambda]*Cos[2*\[Theta]]*(BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - BesselI[1, r*\[CapitalLambda]]*Subscript[f, 0]) + 
      (\[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*Subscript[g, 2])/2 + 
      Cos[4*\[Theta]]*((2*Subscript[b, 2])/r^3 - 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 + 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2), 
     Sin[2*\[Theta]]*(\[CapitalLambda]*BesselK[1, r*\[CapitalLambda]]*
         Subscript[e, 0] - \[CapitalLambda]*BesselI[1, r*\[CapitalLambda]]*
         Subscript[f, 0]) + Sin[4*\[Theta]]*((-2*Subscript[b, 2])/r^3 + 
        (\[CapitalLambda]*BesselK[3, r*\[CapitalLambda]]*Subscript[e, 2])/2 - 
        (\[CapitalLambda]*BesselI[3, r*\[CapitalLambda]]*Subscript[g, 2])/2)}
 
curlDivQ0 = -(\[CapitalLambda]^2*Sin[2*\[Theta]]*
       (BesselK[2, r*\[CapitalLambda]]*Subscript[e, 0] + 
        BesselI[2, r*\[CapitalLambda]]*Subscript[f, 0])) + 
     (Sin[4*\[Theta]]*((24*Subscript[b, 2])/r^4 - \[CapitalLambda]^2*
         (BesselK[4, r*\[CapitalLambda]]*Subscript[e, 2] + 
          BesselI[4, r*\[CapitalLambda]]*Subscript[g, 2])))/2
