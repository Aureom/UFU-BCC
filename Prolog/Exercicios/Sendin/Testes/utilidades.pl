% Inverte uma lista
inverte(L, LInvertida) :- inverte(L,LInvertida,[]).
inverte([], LInvertida, LInvertida) :- !.
inverte([X|Xs], LInvertida, Z) :- inverte(Xs, LInvertida, [X|Z]).

% Remove elementos repetidos de uma lista
remove_repetido([],[]).
remove_repetido([X],[X]).
remove_repetido([X,X|Xs],Zs) :- remove_repetido([X|Xs],Zs).
remove_repetido([X,Y|Ys],[X|Zs]) :- X \= Y, remove_repetido([Y|Ys],Zs).