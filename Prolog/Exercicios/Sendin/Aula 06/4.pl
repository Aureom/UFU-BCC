%travessias
tempo(voce, 1).
tempo(pesquisador, 2).
tempo(zelador, 5).
tempo(professor, 10).

testar([], 1, [_,_,_,_], Tempo) :- Tempo =< 17.

testar([a,b,c,d], X, [], Tempo) :- tempo(A, B), write(A), nl, write(B).

min_tempo(A, B) :- tempo(A, B).