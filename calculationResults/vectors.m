polarTangVecs = {{-(Derivative[1, 0][Subscript[R, 1]][\[Theta], t]/
        Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2]), 
      -(Subscript[R, 1][\[Theta], t]/Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2])}, 
     {Derivative[1, 0][Subscript[R, 2]][\[Theta], t]/
       Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2], 
      Subscript[R, 2][\[Theta], t]/Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2]}}
 
polarNormVecs = {{-(Subscript[R, 1][\[Theta], t]/
        Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2]), 
      Derivative[1, 0][Subscript[R, 1]][\[Theta], t]/
       Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2]}, 
     {Subscript[R, 2][\[Theta], t]/Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2], 
      -(Derivative[1, 0][Subscript[R, 2]][\[Theta], t]/
        Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2])}}
 
polarKappaNormVecs = 
    {{-((Subscript[R, 1][\[Theta], t]*(Subscript[R, 1][\[Theta], t]^2 + 
          2*Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2 - 
          Subscript[R, 1][\[Theta], t]*Derivative[2, 0][Subscript[R, 1]][
            \[Theta], t]))/(Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)^2), 
      (Derivative[1, 0][Subscript[R, 1]][\[Theta], t]*
        (Subscript[R, 1][\[Theta], t]^2 + 2*Derivative[1, 0][Subscript[R, 1]][
            \[Theta], t]^2 - Subscript[R, 1][\[Theta], t]*
          Derivative[2, 0][Subscript[R, 1]][\[Theta], t]))/
       (Subscript[R, 1][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 1]][
           \[Theta], t]^2)^2}, 
     {-((Subscript[R, 2][\[Theta], t]*(Subscript[R, 2][\[Theta], t]^2 + 
          2*Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2 - 
          Subscript[R, 2][\[Theta], t]*Derivative[2, 0][Subscript[R, 2]][
            \[Theta], t]))/(Subscript[R, 2][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2)^2), 
      (Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
        (Subscript[R, 2][\[Theta], t]^2 + 2*Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2 - Subscript[R, 2][\[Theta], t]*
          Derivative[2, 0][Subscript[R, 2]][\[Theta], t]))/
       (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
           \[Theta], t]^2)^2}}
polarTangVecs = {{-(Derivative[1, 0][Subscript[R, 1]][\[Theta], t]/
        Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2]), 
      -(Subscript[R, 1][\[Theta], t]/Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2])}, 
     {Derivative[1, 0][Subscript[R, 2]][\[Theta], t]/
       Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2], 
      Subscript[R, 2][\[Theta], t]/Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2]}}
 
polarNormVecs = {{-(Subscript[R, 1][\[Theta], t]/
        Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2]), 
      Derivative[1, 0][Subscript[R, 1]][\[Theta], t]/
       Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2]}, 
     {Subscript[R, 2][\[Theta], t]/Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2], 
      -(Derivative[1, 0][Subscript[R, 2]][\[Theta], t]/
        Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2])}}
 
polarKappaNormVecs = 
    {{-((Subscript[R, 1][\[Theta], t]*(Subscript[R, 1][\[Theta], t]^2 + 
          2*Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2 - 
          Subscript[R, 1][\[Theta], t]*Derivative[2, 0][Subscript[R, 1]][
            \[Theta], t]))/(Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)^2), 
      (Derivative[1, 0][Subscript[R, 1]][\[Theta], t]*
        (Subscript[R, 1][\[Theta], t]^2 + 2*Derivative[1, 0][Subscript[R, 1]][
            \[Theta], t]^2 - Subscript[R, 1][\[Theta], t]*
          Derivative[2, 0][Subscript[R, 1]][\[Theta], t]))/
       (Subscript[R, 1][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 1]][
           \[Theta], t]^2)^2}, 
     {-((Subscript[R, 2][\[Theta], t]*(Subscript[R, 2][\[Theta], t]^2 + 
          2*Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2 - 
          Subscript[R, 2][\[Theta], t]*Derivative[2, 0][Subscript[R, 2]][
            \[Theta], t]))/(Subscript[R, 2][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2)^2), 
      (Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
        (Subscript[R, 2][\[Theta], t]^2 + 2*Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2 - Subscript[R, 2][\[Theta], t]*
          Derivative[2, 0][Subscript[R, 2]][\[Theta], t]))/
       (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
           \[Theta], t]^2)^2}}
polarTangVecs = {{-(Derivative[1, 0][Subscript[R, 1]][\[Theta], t]/
        Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2]), 
      -(Subscript[R, 1][\[Theta], t]/Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2])}, 
     {Derivative[1, 0][Subscript[R, 2]][\[Theta], t]/
       Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2], 
      Subscript[R, 2][\[Theta], t]/Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2]}}
 
polarNormVecs = {{-(Subscript[R, 1][\[Theta], t]/
        Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2]), 
      Derivative[1, 0][Subscript[R, 1]][\[Theta], t]/
       Sqrt[Subscript[R, 1][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2]}, 
     {Subscript[R, 2][\[Theta], t]/Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
         Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2], 
      -(Derivative[1, 0][Subscript[R, 2]][\[Theta], t]/
        Sqrt[Subscript[R, 2][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2])}}
 
polarKappaNormVecs = 
    {{-((Subscript[R, 1][\[Theta], t]*(Subscript[R, 1][\[Theta], t]^2 + 
          2*Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2 - 
          Subscript[R, 1][\[Theta], t]*Derivative[2, 0][Subscript[R, 1]][
            \[Theta], t]))/(Subscript[R, 1][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 1]][\[Theta], t]^2)^2), 
      (Derivative[1, 0][Subscript[R, 1]][\[Theta], t]*
        (Subscript[R, 1][\[Theta], t]^2 + 2*Derivative[1, 0][Subscript[R, 1]][
            \[Theta], t]^2 - Subscript[R, 1][\[Theta], t]*
          Derivative[2, 0][Subscript[R, 1]][\[Theta], t]))/
       (Subscript[R, 1][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 1]][
           \[Theta], t]^2)^2}, 
     {-((Subscript[R, 2][\[Theta], t]*(Subscript[R, 2][\[Theta], t]^2 + 
          2*Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2 - 
          Subscript[R, 2][\[Theta], t]*Derivative[2, 0][Subscript[R, 2]][
            \[Theta], t]))/(Subscript[R, 2][\[Theta], t]^2 + 
          Derivative[1, 0][Subscript[R, 2]][\[Theta], t]^2)^2), 
      (Derivative[1, 0][Subscript[R, 2]][\[Theta], t]*
        (Subscript[R, 2][\[Theta], t]^2 + 2*Derivative[1, 0][Subscript[R, 2]][
            \[Theta], t]^2 - Subscript[R, 2][\[Theta], t]*
          Derivative[2, 0][Subscript[R, 2]][\[Theta], t]))/
       (Subscript[R, 2][\[Theta], t]^2 + Derivative[1, 0][Subscript[R, 2]][
           \[Theta], t]^2)^2}}
