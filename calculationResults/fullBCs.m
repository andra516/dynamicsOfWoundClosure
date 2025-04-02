replaceNematicBCs = {q1[Subscript[R, 1][\[Theta], t], \[Theta], t] -> 
      -1 + Subscript[\[Beta], 1]*(Cos[2*\[Theta]] - 
         (2*Subscript[R, 1][\[Theta], t]*(Cos[2*\[Theta]]*Subscript[R, 1][
              \[Theta], t] + Sin[2*\[Theta]]*Derivative[1, 0][Subscript[R, 
                1]][\[Theta], t]))/(Subscript[R, 1][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)), 
     q2[Subscript[R, 1][\[Theta], t], \[Theta], t] -> 
      (-(Sin[2*\[Theta]]*Subscript[\[Beta], 1]*Subscript[R, 1][\[Theta], t]^
           2) + 2*Cos[2*\[Theta]]*Subscript[\[Beta], 1]*
         Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
          \[Theta], t] + Sin[2*\[Theta]]*Subscript[\[Beta], 1]*
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)/
       (Subscript[R, 1][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 1]][
          \[Theta], t]^2), q1[Subscript[R, 2][\[Theta], t], \[Theta], t] -> 
      -1 + Subscript[\[Beta], 2], q2[Subscript[R, 2][\[Theta], t], \[Theta], 
       t] -> 0}
 
DBCs = {{(Subscript[R, 1][\[Theta], t]^2 + 
         2*Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2 - 
         Subscript[R, 1][\[Theta], t]*Derivative[2, 0][Subscript[R, 1]][
           \[Theta], t])/(Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)^(3/2) == 
       -pOut[Subscript[R, 1][\[Theta], t], \[Theta], t] - 
        Subscript[\[Beta], 1]*Subscript[\[Epsilon], \[Alpha]] + 
        (2*(vt[Subscript[R, 1][\[Theta], t], \[Theta], t]*Subscript[R, 1][
             \[Theta], t]*Derivative[1, 0][Subscript[R, 1]][\[Theta], t] + 
           vr[Subscript[R, 1][\[Theta], t], \[Theta], t]*
            Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2 - 
           Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
             \[Theta], t]*Derivative[0, 1, 0][vr][Subscript[R, 1][\[Theta], 
              t], \[Theta], t] + Derivative[1, 0][Subscript[R, 1]][\[Theta], 
              t]^2*Derivative[0, 1, 0][vt][Subscript[R, 1][\[Theta], t], 
             \[Theta], t] + Subscript[R, 1][\[Theta], t]^3*
            Derivative[1, 0, 0][vr][Subscript[R, 1][\[Theta], t], \[Theta], 
             t] - Subscript[R, 1][\[Theta], t]^2*Derivative[1, 0][
              Subscript[R, 1]][\[Theta], t]*Derivative[1, 0, 0][vt][
             Subscript[R, 1][\[Theta], t], \[Theta], t]))/
         (Subscript[R, 1][\[Theta], t]*(Subscript[R, 1][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)), 
      0 == (-2*vr[Subscript[R, 1][\[Theta], t], \[Theta], t]*
          Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
           \[Theta], t] + vt[Subscript[R, 1][\[Theta], t], \[Theta], t]*
          (-Subscript[R, 1][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2) + 
         Subscript[R, 1][\[Theta], t]^2*Derivative[0, 1, 0][vr][
           Subscript[R, 1][\[Theta], t], \[Theta], t] - 
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2*
          Derivative[0, 1, 0][vr][Subscript[R, 1][\[Theta], t], \[Theta], 
           t] - 2*Subscript[R, 1][\[Theta], t]*
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]*
          Derivative[0, 1, 0][vt][Subscript[R, 1][\[Theta], t], \[Theta], 
           t] + 2*Subscript[R, 1][\[Theta], t]^2*
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]*
          Derivative[1, 0, 0][vr][Subscript[R, 1][\[Theta], t], \[Theta], 
           t] + Subscript[R, 1][\[Theta], t]^3*Derivative[1, 0, 0][vt][
           Subscript[R, 1][\[Theta], t], \[Theta], t] - 
         Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
            \[Theta], t]^2*Derivative[1, 0, 0][vt][Subscript[R, 1][\[Theta], 
            t], \[Theta], t])/(Subscript[R, 1][\[Theta], t]*
         (Subscript[R, 1][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 1]][
            \[Theta], t]^2))}, 
     {(-Subscript[R, 2][\[Theta], t]^2 - 2*Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2 + Subscript[R, 2][\[Theta], t]*
          Derivative[2, 0][Subscript[R, 2]][\[Theta], t])/
        (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2)^(3/2) == (Subscript[R, 2][\[Theta], t]*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          (2*vt[Subscript[R, 2][\[Theta], t], \[Theta], t] + 
           (P - pOut[Subscript[R, 2][\[Theta], t], \[Theta], t] - 
             Cos[2*\[Theta]]*Subscript[\[Beta], 2]*Subscript[\[Epsilon], 
               \[Alpha]])*Derivative[1, 0][Subscript[R, 2]][\[Theta], t] - 
           2*Derivative[0, 1, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
             t]) + 2*Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2*
          (vr[Subscript[R, 2][\[Theta], t], \[Theta], t] + 
           Derivative[0, 1, 0][vt][Subscript[R, 2][\[Theta], t], \[Theta], 
            t]) + Subscript[R, 2][\[Theta], t]^3*
          (P - pOut[Subscript[R, 2][\[Theta], t], \[Theta], t] + 
           Cos[2*\[Theta]]*Subscript[\[Beta], 2]*Subscript[\[Epsilon], 
             \[Alpha]] + 2*Derivative[1, 0, 0][vr][Subscript[R, 2][\[Theta], 
              t], \[Theta], t]) + 2*Subscript[R, 2][\[Theta], t]^2*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          (Sin[2*\[Theta]]*Subscript[\[Beta], 2]*Subscript[\[Epsilon], 
             \[Alpha]] - Derivative[1, 0, 0][vt][Subscript[R, 2][\[Theta], 
             t], \[Theta], t]))/(Subscript[R, 2][\[Theta], t]*
         (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2)), 
      0 == (-2*vr[Subscript[R, 2][\[Theta], t], \[Theta], t]*
          Subscript[R, 2][\[Theta], t]*Derivative[1, 0][Subscript[R, 2]][
           \[Theta], t] + vt[Subscript[R, 2][\[Theta], t], \[Theta], t]*
          (-Subscript[R, 2][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2) - 
         Subscript[\[Beta], 2]*Subscript[\[Epsilon], \[Alpha]]*
          Subscript[R, 2][\[Theta], t]*(Sin[2*\[Theta]]*
            Subscript[R, 2][\[Theta], t]^2 - 2*Cos[2*\[Theta]]*
            Subscript[R, 2][\[Theta], t]*Derivative[1, 0][Subscript[R, 2]][
             \[Theta], t] - Sin[2*\[Theta]]*Derivative[1, 0][Subscript[R, 2]][
              \[Theta], t]^2) + Subscript[R, 2][\[Theta], t]^2*
          Derivative[0, 1, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] - Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2*
          Derivative[0, 1, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] - 2*Subscript[R, 2][\[Theta], t]*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          Derivative[0, 1, 0][vt][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] + 2*Subscript[R, 2][\[Theta], t]^2*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          Derivative[1, 0, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] + Subscript[R, 2][\[Theta], t]^3*Derivative[1, 0, 0][vt][
           Subscript[R, 2][\[Theta], t], \[Theta], t] - 
         Subscript[R, 2][\[Theta], t]*Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2*Derivative[1, 0, 0][vt][Subscript[R, 2][\[Theta], 
            t], \[Theta], t])/(Subscript[R, 2][\[Theta], t]*
         (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2))}}
 
KBCs = {vr[Subscript[R, 1][\[Theta], t], \[Theta], t] - 
       Derivative[0, 1][Subscript[R, 1]][\[Theta], t] - 
       (vt[Subscript[R, 1][\[Theta], t], \[Theta], t]*
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t])/
        Subscript[R, 1][\[Theta], t] == 0, 
     vr[Subscript[R, 2][\[Theta], t], \[Theta], t] - 
       Derivative[0, 1][Subscript[R, 2]][\[Theta], t] - 
       (vt[Subscript[R, 2][\[Theta], t], \[Theta], t]*
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t])/
        Subscript[R, 2][\[Theta], t] == 0}
replaceNematicBCs = {q1[Subscript[R, 1][\[Theta], t], \[Theta], t] -> 
      -1 + Subscript[\[Beta], 1]*(Cos[2*\[Theta]] - 
         (2*Subscript[R, 1][\[Theta], t]*(Cos[2*\[Theta]]*Subscript[R, 1][
              \[Theta], t] + Sin[2*\[Theta]]*Derivative[1, 0][Subscript[R, 
                1]][\[Theta], t]))/(Subscript[R, 1][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)), 
     q2[Subscript[R, 1][\[Theta], t], \[Theta], t] -> 
      (-(Sin[2*\[Theta]]*Subscript[\[Beta], 1]*Subscript[R, 1][\[Theta], t]^
           2) + 2*Cos[2*\[Theta]]*Subscript[\[Beta], 1]*
         Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
          \[Theta], t] + Sin[2*\[Theta]]*Subscript[\[Beta], 1]*
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)/
       (Subscript[R, 1][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 1]][
          \[Theta], t]^2), q1[Subscript[R, 2][\[Theta], t], \[Theta], t] -> 
      -1 + Subscript[\[Beta], 2], q2[Subscript[R, 2][\[Theta], t], \[Theta], 
       t] -> 0}
 
DBCs = {{(Subscript[R, 1][\[Theta], t]^2 + 
         2*Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2 - 
         Subscript[R, 1][\[Theta], t]*Derivative[2, 0][Subscript[R, 1]][
           \[Theta], t])/(Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)^(3/2) == 
       -pOut[Subscript[R, 1][\[Theta], t], \[Theta], t] - 
        Subscript[\[Beta], 1]*Subscript[\[Epsilon], \[Alpha]] + 
        (2*(vt[Subscript[R, 1][\[Theta], t], \[Theta], t]*Subscript[R, 1][
             \[Theta], t]*Derivative[1, 0][Subscript[R, 1]][\[Theta], t] + 
           vr[Subscript[R, 1][\[Theta], t], \[Theta], t]*
            Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2 - 
           Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
             \[Theta], t]*Derivative[0, 1, 0][vr][Subscript[R, 1][\[Theta], 
              t], \[Theta], t] + Derivative[1, 0][Subscript[R, 1]][\[Theta], 
              t]^2*Derivative[0, 1, 0][vt][Subscript[R, 1][\[Theta], t], 
             \[Theta], t] + Subscript[R, 1][\[Theta], t]^3*
            Derivative[1, 0, 0][vr][Subscript[R, 1][\[Theta], t], \[Theta], 
             t] - Subscript[R, 1][\[Theta], t]^2*Derivative[1, 0][
              Subscript[R, 1]][\[Theta], t]*Derivative[1, 0, 0][vt][
             Subscript[R, 1][\[Theta], t], \[Theta], t]))/
         (Subscript[R, 1][\[Theta], t]*(Subscript[R, 1][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)), 
      0 == (-2*vr[Subscript[R, 1][\[Theta], t], \[Theta], t]*
          Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
           \[Theta], t] + vt[Subscript[R, 1][\[Theta], t], \[Theta], t]*
          (-Subscript[R, 1][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2) + 
         Subscript[R, 1][\[Theta], t]^2*Derivative[0, 1, 0][vr][
           Subscript[R, 1][\[Theta], t], \[Theta], t] - 
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2*
          Derivative[0, 1, 0][vr][Subscript[R, 1][\[Theta], t], \[Theta], 
           t] - 2*Subscript[R, 1][\[Theta], t]*
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]*
          Derivative[0, 1, 0][vt][Subscript[R, 1][\[Theta], t], \[Theta], 
           t] + 2*Subscript[R, 1][\[Theta], t]^2*
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]*
          Derivative[1, 0, 0][vr][Subscript[R, 1][\[Theta], t], \[Theta], 
           t] + Subscript[R, 1][\[Theta], t]^3*Derivative[1, 0, 0][vt][
           Subscript[R, 1][\[Theta], t], \[Theta], t] - 
         Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
            \[Theta], t]^2*Derivative[1, 0, 0][vt][Subscript[R, 1][\[Theta], 
            t], \[Theta], t])/(Subscript[R, 1][\[Theta], t]*
         (Subscript[R, 1][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 1]][
            \[Theta], t]^2))}, 
     {(-Subscript[R, 2][\[Theta], t]^2 - 2*Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2 + Subscript[R, 2][\[Theta], t]*
          Derivative[2, 0][Subscript[R, 2]][\[Theta], t])/
        (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2)^(3/2) == (Subscript[R, 2][\[Theta], t]*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          (2*vt[Subscript[R, 2][\[Theta], t], \[Theta], t] + 
           (P - pOut[Subscript[R, 2][\[Theta], t], \[Theta], t] - 
             Cos[2*\[Theta]]*Subscript[\[Beta], 2]*Subscript[\[Epsilon], 
               \[Alpha]])*Derivative[1, 0][Subscript[R, 2]][\[Theta], t] - 
           2*Derivative[0, 1, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
             t]) + 2*Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2*
          (vr[Subscript[R, 2][\[Theta], t], \[Theta], t] + 
           Derivative[0, 1, 0][vt][Subscript[R, 2][\[Theta], t], \[Theta], 
            t]) + Subscript[R, 2][\[Theta], t]^3*
          (P - pOut[Subscript[R, 2][\[Theta], t], \[Theta], t] + 
           Cos[2*\[Theta]]*Subscript[\[Beta], 2]*Subscript[\[Epsilon], 
             \[Alpha]] + 2*Derivative[1, 0, 0][vr][Subscript[R, 2][\[Theta], 
              t], \[Theta], t]) + 2*Subscript[R, 2][\[Theta], t]^2*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          (Sin[2*\[Theta]]*Subscript[\[Beta], 2]*Subscript[\[Epsilon], 
             \[Alpha]] - Derivative[1, 0, 0][vt][Subscript[R, 2][\[Theta], 
             t], \[Theta], t]))/(Subscript[R, 2][\[Theta], t]*
         (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2)), 
      0 == (-2*vr[Subscript[R, 2][\[Theta], t], \[Theta], t]*
          Subscript[R, 2][\[Theta], t]*Derivative[1, 0][Subscript[R, 2]][
           \[Theta], t] + vt[Subscript[R, 2][\[Theta], t], \[Theta], t]*
          (-Subscript[R, 2][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2) - 
         Subscript[\[Beta], 2]*Subscript[\[Epsilon], \[Alpha]]*
          Subscript[R, 2][\[Theta], t]*(Sin[2*\[Theta]]*
            Subscript[R, 2][\[Theta], t]^2 - 2*Cos[2*\[Theta]]*
            Subscript[R, 2][\[Theta], t]*Derivative[1, 0][Subscript[R, 2]][
             \[Theta], t] - Sin[2*\[Theta]]*Derivative[1, 0][Subscript[R, 2]][
              \[Theta], t]^2) + Subscript[R, 2][\[Theta], t]^2*
          Derivative[0, 1, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] - Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2*
          Derivative[0, 1, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] - 2*Subscript[R, 2][\[Theta], t]*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          Derivative[0, 1, 0][vt][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] + 2*Subscript[R, 2][\[Theta], t]^2*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          Derivative[1, 0, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] + Subscript[R, 2][\[Theta], t]^3*Derivative[1, 0, 0][vt][
           Subscript[R, 2][\[Theta], t], \[Theta], t] - 
         Subscript[R, 2][\[Theta], t]*Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2*Derivative[1, 0, 0][vt][Subscript[R, 2][\[Theta], 
            t], \[Theta], t])/(Subscript[R, 2][\[Theta], t]*
         (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2))}}
 
KBCs = {vr[Subscript[R, 1][\[Theta], t], \[Theta], t] - 
       Derivative[0, 1][Subscript[R, 1]][\[Theta], t] - 
       (vt[Subscript[R, 1][\[Theta], t], \[Theta], t]*
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t])/
        Subscript[R, 1][\[Theta], t] == 0, 
     vr[Subscript[R, 2][\[Theta], t], \[Theta], t] - 
       Derivative[0, 1][Subscript[R, 2]][\[Theta], t] - 
       (vt[Subscript[R, 2][\[Theta], t], \[Theta], t]*
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t])/
        Subscript[R, 2][\[Theta], t] == 0}
replaceNematicBCs = {q1[Subscript[R, 1][\[Theta], t], \[Theta], t] -> 
      -1 + Subscript[\[Beta], 1]*(Cos[2*\[Theta]] - 
         (2*Subscript[R, 1][\[Theta], t]*(Cos[2*\[Theta]]*Subscript[R, 1][
              \[Theta], t] + Sin[2*\[Theta]]*Derivative[1, 0][Subscript[R, 
                1]][\[Theta], t]))/(Subscript[R, 1][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)), 
     q2[Subscript[R, 1][\[Theta], t], \[Theta], t] -> 
      (-(Sin[2*\[Theta]]*Subscript[\[Beta], 1]*Subscript[R, 1][\[Theta], t]^
           2) + 2*Cos[2*\[Theta]]*Subscript[\[Beta], 1]*
         Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
          \[Theta], t] + Sin[2*\[Theta]]*Subscript[\[Beta], 1]*
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)/
       (Subscript[R, 1][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 1]][
          \[Theta], t]^2), q1[Subscript[R, 2][\[Theta], t], \[Theta], t] -> 
      -1 + Subscript[\[Beta], 2], q2[Subscript[R, 2][\[Theta], t], \[Theta], 
       t] -> 0}
 
DBCs = {{(Subscript[R, 1][\[Theta], t]^2 + 
         2*Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2 - 
         Subscript[R, 1][\[Theta], t]*Derivative[2, 0][Subscript[R, 1]][
           \[Theta], t])/(Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)^(3/2) == 
       -pOut[Subscript[R, 1][\[Theta], t], \[Theta], t] - 
        Subscript[\[Beta], 1]*Subscript[\[Epsilon], \[Alpha]] + 
        (2*(vt[Subscript[R, 1][\[Theta], t], \[Theta], t]*Subscript[R, 1][
             \[Theta], t]*Derivative[1, 0][Subscript[R, 1]][\[Theta], t] + 
           vr[Subscript[R, 1][\[Theta], t], \[Theta], t]*
            Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2 - 
           Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
             \[Theta], t]*Derivative[0, 1, 0][vr][Subscript[R, 1][\[Theta], 
              t], \[Theta], t] + Derivative[1, 0][Subscript[R, 1]][\[Theta], 
              t]^2*Derivative[0, 1, 0][vt][Subscript[R, 1][\[Theta], t], 
             \[Theta], t] + Subscript[R, 1][\[Theta], t]^3*
            Derivative[1, 0, 0][vr][Subscript[R, 1][\[Theta], t], \[Theta], 
             t] - Subscript[R, 1][\[Theta], t]^2*Derivative[1, 0][
              Subscript[R, 1]][\[Theta], t]*Derivative[1, 0, 0][vt][
             Subscript[R, 1][\[Theta], t], \[Theta], t]))/
         (Subscript[R, 1][\[Theta], t]*(Subscript[R, 1][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)), 
      0 == (-2*vr[Subscript[R, 1][\[Theta], t], \[Theta], t]*
          Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
           \[Theta], t] + vt[Subscript[R, 1][\[Theta], t], \[Theta], t]*
          (-Subscript[R, 1][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2) + 
         Subscript[R, 1][\[Theta], t]^2*Derivative[0, 1, 0][vr][
           Subscript[R, 1][\[Theta], t], \[Theta], t] - 
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2*
          Derivative[0, 1, 0][vr][Subscript[R, 1][\[Theta], t], \[Theta], 
           t] - 2*Subscript[R, 1][\[Theta], t]*
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]*
          Derivative[0, 1, 0][vt][Subscript[R, 1][\[Theta], t], \[Theta], 
           t] + 2*Subscript[R, 1][\[Theta], t]^2*
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]*
          Derivative[1, 0, 0][vr][Subscript[R, 1][\[Theta], t], \[Theta], 
           t] + Subscript[R, 1][\[Theta], t]^3*Derivative[1, 0, 0][vt][
           Subscript[R, 1][\[Theta], t], \[Theta], t] - 
         Subscript[R, 1][\[Theta], t]*Derivative[1, 0][Subscript[R, 1]][
            \[Theta], t]^2*Derivative[1, 0, 0][vt][Subscript[R, 1][\[Theta], 
            t], \[Theta], t])/(Subscript[R, 1][\[Theta], t]*
         (Subscript[R, 1][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 1]][
            \[Theta], t]^2))}, 
     {(-Subscript[R, 2][\[Theta], t]^2 - 2*Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2 + Subscript[R, 2][\[Theta], t]*
          Derivative[2, 0][Subscript[R, 2]][\[Theta], t])/
        (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2)^(3/2) == (Subscript[R, 2][\[Theta], t]*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          (2*vt[Subscript[R, 2][\[Theta], t], \[Theta], t] + 
           (P - pOut[Subscript[R, 2][\[Theta], t], \[Theta], t] - 
             Cos[2*\[Theta]]*Subscript[\[Beta], 2]*Subscript[\[Epsilon], 
               \[Alpha]])*Derivative[1, 0][Subscript[R, 2]][\[Theta], t] - 
           2*Derivative[0, 1, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
             t]) + 2*Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2*
          (vr[Subscript[R, 2][\[Theta], t], \[Theta], t] + 
           Derivative[0, 1, 0][vt][Subscript[R, 2][\[Theta], t], \[Theta], 
            t]) + Subscript[R, 2][\[Theta], t]^3*
          (P - pOut[Subscript[R, 2][\[Theta], t], \[Theta], t] + 
           Cos[2*\[Theta]]*Subscript[\[Beta], 2]*Subscript[\[Epsilon], 
             \[Alpha]] + 2*Derivative[1, 0, 0][vr][Subscript[R, 2][\[Theta], 
              t], \[Theta], t]) + 2*Subscript[R, 2][\[Theta], t]^2*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          (Sin[2*\[Theta]]*Subscript[\[Beta], 2]*Subscript[\[Epsilon], 
             \[Alpha]] - Derivative[1, 0, 0][vt][Subscript[R, 2][\[Theta], 
             t], \[Theta], t]))/(Subscript[R, 2][\[Theta], t]*
         (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2)), 
      0 == (-2*vr[Subscript[R, 2][\[Theta], t], \[Theta], t]*
          Subscript[R, 2][\[Theta], t]*Derivative[1, 0][Subscript[R, 2]][
           \[Theta], t] + vt[Subscript[R, 2][\[Theta], t], \[Theta], t]*
          (-Subscript[R, 2][\[Theta], t]^2 + 
           Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2) - 
         Subscript[\[Beta], 2]*Subscript[\[Epsilon], \[Alpha]]*
          Subscript[R, 2][\[Theta], t]*(Sin[2*\[Theta]]*
            Subscript[R, 2][\[Theta], t]^2 - 2*Cos[2*\[Theta]]*
            Subscript[R, 2][\[Theta], t]*Derivative[1, 0][Subscript[R, 2]][
             \[Theta], t] - Sin[2*\[Theta]]*Derivative[1, 0][Subscript[R, 2]][
              \[Theta], t]^2) + Subscript[R, 2][\[Theta], t]^2*
          Derivative[0, 1, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] - Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2*
          Derivative[0, 1, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] - 2*Subscript[R, 2][\[Theta], t]*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          Derivative[0, 1, 0][vt][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] + 2*Subscript[R, 2][\[Theta], t]^2*
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
          Derivative[1, 0, 0][vr][Subscript[R, 2][\[Theta], t], \[Theta], 
           t] + Subscript[R, 2][\[Theta], t]^3*Derivative[1, 0, 0][vt][
           Subscript[R, 2][\[Theta], t], \[Theta], t] - 
         Subscript[R, 2][\[Theta], t]*Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2*Derivative[1, 0, 0][vt][Subscript[R, 2][\[Theta], 
            t], \[Theta], t])/(Subscript[R, 2][\[Theta], t]*
         (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2))}}
 
KBCs = {vr[Subscript[R, 1][\[Theta], t], \[Theta], t] - 
       Derivative[0, 1][Subscript[R, 1]][\[Theta], t] - 
       (vt[Subscript[R, 1][\[Theta], t], \[Theta], t]*
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t])/
        Subscript[R, 1][\[Theta], t] == 0, 
     vr[Subscript[R, 2][\[Theta], t], \[Theta], t] - 
       Derivative[0, 1][Subscript[R, 2]][\[Theta], t] - 
       (vt[Subscript[R, 2][\[Theta], t], \[Theta], t]*
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t])/
        Subscript[R, 2][\[Theta], t] == 0}
