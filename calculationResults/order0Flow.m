flow0Coeffs = {Subscript[cc, 0] -> (Superscript[Subscript[R, 1], 0][t]*
        Superscript[Subscript[R, 2], 0][t]*(Superscript[Subscript[R, 2], 0][
          t] + Superscript[Subscript[R, 1], 0][t]*
          (1 + P*Superscript[Subscript[R, 2], 0][t])))/
       (-2*Superscript[Subscript[R, 2], 0][t]^2 + 
        Superscript[Subscript[R, 1], 0][t]^2*
         (2 + Log[Superscript[Subscript[R, 1], 0][t]/Superscript[Subscript[R, 
                2], 0][t]]*Superscript[Subscript[R, 2], 0][t]^2)), 
     Subscript[dd, 0] -> ((-Log[Superscript[Subscript[R, 2], 0][t]] + 
          2/Superscript[Subscript[R, 2], 0][t]^2)/
         Superscript[Subscript[R, 1], 0][t] + 
        (-Log[Superscript[Subscript[R, 1], 0][t]] + 
          2/Superscript[Subscript[R, 1], 0][t]^2)*
         (P + Superscript[Subscript[R, 2], 0][t]^(-1)))/
       (Log[Superscript[Subscript[R, 2], 0][t]/Superscript[Subscript[R, 1], 
            0][t]] + 2/Superscript[Subscript[R, 1], 0][t]^2 - 
        2/Superscript[Subscript[R, 2], 0][t]^2), Subscript[aa, 2] -> 0, 
     Subscript[bb, 2] -> 0, Subscript[cc, 2] -> 0, Subscript[dd, 2] -> 0, 
     Subscript[aa, 4] -> 0, Subscript[bb, 4] -> 0, Subscript[cc, 4] -> 0, 
     Subscript[dd, 4] -> 0, Subscript[ee, 2] -> 0, Subscript[ff, 2] -> 0, 
     Subscript[gg, 2] -> 0, Subscript[hh, 2] -> 0, Subscript[ee, 4] -> 0, 
     Subscript[ff, 4] -> 0, Subscript[gg, 4] -> 0, Subscript[hh, 4] -> 0}
 
streamSol0[r_, \[Theta]_, t_] = \[Theta]*Subscript[cc, 0]
 
pressureSol0[r_, \[Theta]_, t_] = -(Log[r]*Subscript[cc, 0]) + 
     Subscript[dd, 0]
 
R0ODEs = {Derivative[1][Superscript[Subscript[R, 1], 0]][t] == 
      (Superscript[Subscript[R, 2], 0][t]*(Superscript[Subscript[R, 2], 0][
          t] + Superscript[Subscript[R, 1], 0][t]*
          (1 + P*Superscript[Subscript[R, 2], 0][t])))/
       (-2*Superscript[Subscript[R, 2], 0][t]^2 + 
        Superscript[Subscript[R, 1], 0][t]^2*
         (2 + Log[Superscript[Subscript[R, 1], 0][t]/Superscript[Subscript[R, 
                2], 0][t]]*Superscript[Subscript[R, 2], 0][t]^2)), 
     Derivative[1][Superscript[Subscript[R, 2], 0]][t] == 
      (Superscript[Subscript[R, 1], 0][t]*(Superscript[Subscript[R, 2], 0][
          t] + Superscript[Subscript[R, 1], 0][t]*
          (1 + P*Superscript[Subscript[R, 2], 0][t])))/
       (-2*Superscript[Subscript[R, 2], 0][t]^2 + 
        Superscript[Subscript[R, 1], 0][t]^2*
         (2 + Log[Superscript[Subscript[R, 1], 0][t]/Superscript[Subscript[R, 
                2], 0][t]]*Superscript[Subscript[R, 2], 0][t]^2))}
 
replaceR0s = {Derivative[1][Superscript[Subscript[R, 1], 0]][t] -> 
      (Superscript[Subscript[R, 2], 0][t]*(Superscript[Subscript[R, 2], 0][
          t] + Superscript[Subscript[R, 1], 0][t]*
          (1 + P*Superscript[Subscript[R, 2], 0][t])))/
       (-2*Superscript[Subscript[R, 2], 0][t]^2 + 
        Superscript[Subscript[R, 1], 0][t]^2*
         (2 + Log[Superscript[Subscript[R, 1], 0][t]/Superscript[Subscript[R, 
                2], 0][t]]*Superscript[Subscript[R, 2], 0][t]^2)), 
     Derivative[1][Superscript[Subscript[R, 2], 0]][t] -> 
      (Superscript[Subscript[R, 1], 0][t]*(Superscript[Subscript[R, 2], 0][
          t] + Superscript[Subscript[R, 1], 0][t]*
          (1 + P*Superscript[Subscript[R, 2], 0][t])))/
       (-2*Superscript[Subscript[R, 2], 0][t]^2 + 
        Superscript[Subscript[R, 1], 0][t]^2*
         (2 + Log[Superscript[Subscript[R, 1], 0][t]/Superscript[Subscript[R, 
                2], 0][t]]*Superscript[Subscript[R, 2], 0][t]^2))}
