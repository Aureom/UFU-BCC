p(1).
p(2).
p(3).
p(4).
p(5).
p(6).

move_cavalo([L1, C1], [L2, C2]) :- 
                                    p(L1), p(L2), p(C1), p(C2), L2 is L1+1, C2 is C1+2;
                                    p(L1), p(L2), p(C1), p(C2), L2 is L1+1, C2 is C1-2;
                                    p(L1), p(L2), p(C1), p(C2), L2 is L1-1, C2 is C1+2;
                                    p(L1), p(L2), p(C1), p(C2), L2 is L1-1, C2 is C1-2;
                                    p(L1), p(L2), p(C1), p(C2), L2 is L1+2, C2 is C1+1;
                                    p(L1), p(L2), p(C1), p(C2), L2 is L1+2, C2 is C1-1;
                                    p(L1), p(L2), p(C1), p(C2), L2 is L1-2, C2 is C1+1;
                                    p(L1), p(L2), p(C1), p(C2), L2 is L1-2, C2 is C1-1.

andar([L, C], [LD, CD], MaxMov, Resultado) :- 
    MaxMov == 0, write("Falhou"); 
    L == LD, C == CD, write("Chegou");
    not(member([X, Y], Resultado)),
    write('X='), write(L),
    write('Y='), write(C), nl.