DBC0s = {{Superscript[Subscript[R, 1], 0][t]^(-1) == 
       -Subscript[pOut, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], t] + 
        2*Derivative[1, 0, 0][Subscript[vr, 0]][Superscript[Subscript[R, 1], 
            0][t], \[Theta], t], 
      0 == (-Subscript[vt, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], 
           t] + Derivative[0, 1, 0][Subscript[vr, 0]][
          Superscript[Subscript[R, 1], 0][t], \[Theta], t] + 
         Superscript[Subscript[R, 1], 0][t]*Derivative[1, 0, 0][
            Subscript[vt, 0]][Superscript[Subscript[R, 1], 0][t], \[Theta], 
           t])/Superscript[Subscript[R, 1], 0][t]}, 
     {-Superscript[Subscript[R, 2], 0][t]^(-1) == 
       P - Subscript[pOut, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], 
         t] + 2*Derivative[1, 0, 0][Subscript[vr, 0]][
          Superscript[Subscript[R, 2], 0][t], \[Theta], t], 
      0 == (-Subscript[vt, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], 
           t] + Derivative[0, 1, 0][Subscript[vr, 0]][
          Superscript[Subscript[R, 2], 0][t], \[Theta], t] + 
         Superscript[Subscript[R, 2], 0][t]*Derivative[1, 0, 0][
            Subscript[vt, 0]][Superscript[Subscript[R, 2], 0][t], \[Theta], 
           t])/Superscript[Subscript[R, 2], 0][t]}}
 
pOut[r_, \[Theta]_, t_] = Subscript[pOut, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[pOut, 1][r, \[Theta], t]
 
vr[r_, \[Theta]_, t_] = Subscript[vr, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vr, 1][r, \[Theta], t]
 
vt[r_, \[Theta]_, t_] = Subscript[vt, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vt, 1][r, \[Theta], t]
 
KBC0s = {Subscript[vr, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], t] - 
       Derivative[1][Superscript[Subscript[R, 1], 0]][t] == 0, 
     Subscript[vr, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], t] - 
       Derivative[1][Superscript[Subscript[R, 2], 0]][t] == 0}
 
q1BC0s = {Subscript[q1, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], 
       t] == -1 - Cos[2*\[Theta]]*Subscript[\[Beta], 1], 
     Subscript[q1, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], t] == 
      -1 + Subscript[\[Beta], 2]}
 
q1[r_, \[Theta]_, t_] = Subscript[q1, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q1, 1][r, \[Theta], t]
 
q2BC0s = {Subscript[q2, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], 
       t] == -(Sin[2*\[Theta]]*Subscript[\[Beta], 1]), 
     Subscript[q2, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], t] == 0}
 
q2[r_, \[Theta]_, t_] = Subscript[q2, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q2, 1][r, \[Theta], t]
DBC0s = {{Superscript[Subscript[R, 1], 0][t]^(-1) == 
       -Subscript[pOut, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], t] + 
        2*Derivative[1, 0, 0][Subscript[vr, 0]][Superscript[Subscript[R, 1], 
            0][t], \[Theta], t], 
      0 == (-Subscript[vt, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], 
           t] + Derivative[0, 1, 0][Subscript[vr, 0]][
          Superscript[Subscript[R, 1], 0][t], \[Theta], t] + 
         Superscript[Subscript[R, 1], 0][t]*Derivative[1, 0, 0][
            Subscript[vt, 0]][Superscript[Subscript[R, 1], 0][t], \[Theta], 
           t])/Superscript[Subscript[R, 1], 0][t]}, 
     {-Superscript[Subscript[R, 2], 0][t]^(-1) == 
       P - Subscript[pOut, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], 
         t] + 2*Derivative[1, 0, 0][Subscript[vr, 0]][
          Superscript[Subscript[R, 2], 0][t], \[Theta], t], 
      0 == (-Subscript[vt, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], 
           t] + Derivative[0, 1, 0][Subscript[vr, 0]][
          Superscript[Subscript[R, 2], 0][t], \[Theta], t] + 
         Superscript[Subscript[R, 2], 0][t]*Derivative[1, 0, 0][
            Subscript[vt, 0]][Superscript[Subscript[R, 2], 0][t], \[Theta], 
           t])/Superscript[Subscript[R, 2], 0][t]}}
 
pOut[r_, \[Theta]_, t_] = Subscript[pOut, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[pOut, 1][r, \[Theta], t]
 
vr[r_, \[Theta]_, t_] = Subscript[vr, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vr, 1][r, \[Theta], t]
 
vt[r_, \[Theta]_, t_] = Subscript[vt, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vt, 1][r, \[Theta], t]
 
KBC0s = {Subscript[vr, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], t] - 
       Derivative[1][Superscript[Subscript[R, 1], 0]][t] == 0, 
     Subscript[vr, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], t] - 
       Derivative[1][Superscript[Subscript[R, 2], 0]][t] == 0}
 
q1BC0s = {Subscript[q1, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], 
       t] == -1 - Cos[2*\[Theta]]*Subscript[\[Beta], 1], 
     Subscript[q1, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], t] == 
      -1 + Subscript[\[Beta], 2]}
 
q1[r_, \[Theta]_, t_] = Subscript[q1, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q1, 1][r, \[Theta], t]
 
q2BC0s = {Subscript[q2, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], 
       t] == -(Sin[2*\[Theta]]*Subscript[\[Beta], 1]), 
     Subscript[q2, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], t] == 0}
 
q2[r_, \[Theta]_, t_] = Subscript[q2, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q2, 1][r, \[Theta], t]
DBC0s = {{Superscript[Subscript[R, 1], 0][t]^(-1) == 
       -Subscript[pOut, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], t] + 
        2*Derivative[1, 0, 0][Subscript[vr, 0]][Superscript[Subscript[R, 1], 
            0][t], \[Theta], t], 
      0 == (-Subscript[vt, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], 
           t] + Derivative[0, 1, 0][Subscript[vr, 0]][
          Superscript[Subscript[R, 1], 0][t], \[Theta], t] + 
         Superscript[Subscript[R, 1], 0][t]*Derivative[1, 0, 0][
            Subscript[vt, 0]][Superscript[Subscript[R, 1], 0][t], \[Theta], 
           t])/Superscript[Subscript[R, 1], 0][t]}, 
     {-Superscript[Subscript[R, 2], 0][t]^(-1) == 
       P - Subscript[pOut, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], 
         t] + 2*Derivative[1, 0, 0][Subscript[vr, 0]][
          Superscript[Subscript[R, 2], 0][t], \[Theta], t], 
      0 == (-Subscript[vt, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], 
           t] + Derivative[0, 1, 0][Subscript[vr, 0]][
          Superscript[Subscript[R, 2], 0][t], \[Theta], t] + 
         Superscript[Subscript[R, 2], 0][t]*Derivative[1, 0, 0][
            Subscript[vt, 0]][Superscript[Subscript[R, 2], 0][t], \[Theta], 
           t])/Superscript[Subscript[R, 2], 0][t]}}
 
pOut[r_, \[Theta]_, t_] = Subscript[pOut, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[pOut, 1][r, \[Theta], t]
 
vr[r_, \[Theta]_, t_] = Subscript[vr, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vr, 1][r, \[Theta], t]
 
vt[r_, \[Theta]_, t_] = Subscript[vt, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[vt, 1][r, \[Theta], t]
 
KBC0s = {Subscript[vr, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], t] - 
       Derivative[1][Superscript[Subscript[R, 1], 0]][t] == 0, 
     Subscript[vr, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], t] - 
       Derivative[1][Superscript[Subscript[R, 2], 0]][t] == 0}
 
q1BC0s = {Subscript[q1, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], 
       t] == -1 - Cos[2*\[Theta]]*Subscript[\[Beta], 1], 
     Subscript[q1, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], t] == 
      -1 + Subscript[\[Beta], 2]}
 
q1[r_, \[Theta]_, t_] = Subscript[q1, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q1, 1][r, \[Theta], t]
 
q2BC0s = {Subscript[q2, 0][Superscript[Subscript[R, 1], 0][t], \[Theta], 
       t] == -(Sin[2*\[Theta]]*Subscript[\[Beta], 1]), 
     Subscript[q2, 0][Superscript[Subscript[R, 2], 0][t], \[Theta], t] == 0}
 
q2[r_, \[Theta]_, t_] = Subscript[q2, 0][r, \[Theta], t] + 
     Subscript[\[Epsilon], \[Alpha]]*Subscript[q2, 1][r, \[Theta], t]
