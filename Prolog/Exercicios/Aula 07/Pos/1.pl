% A (Desenvolva as regras para determinar se um dado numere pertence a uma lista de intervalos)
pertence(X, [[A,B]|T]) :- (X >= A, X =< B) ; pertence(X, T). % pertence(6, [[1,5], [9,15]]).

% B
expande([A,A], [A]) :- !.
expande([A,B], [A|T]) :- P is A+1, expande([P,B], T).

linear([[A,B]], X) :- expande([A,B], X).
linear([H|T], X) :- expande(H, T1), linear(T, T2), append(T1, T2, X).


% B (Desenvola uma regra para inserir um numero na lista intervalar bem formada, mantendo-a bem formada.)
inverte(L, LInvertida) :- inverte(L,LInvertida,[]).
inverte([], LInvertida, LInvertida) :- !.
inverte([X|Xs], LInvertida, Z) :- inverte(Xs, LInvertida, [X|Z]).

intervalo_minimo(X, [[A,B]|T], MIN) :- 
    X >= B, MIN is B ; X >= A, MIN is A
    ; 
    intervalo_minimo(X, T, MIN).

intervalo_maximo(X, [[A,B]|T], MAX) :- 
    X =< A, MAX is A ; X =< B, MAX is B
    ;   
    intervalo_maximo(X, T, MAX).

adicionar_intervalo(X, [[A,B]|T]) :- 
    reverse([[A,B]|T], LREV),
    intervalo_minimo(X, LREV, MIN),
	intervalo_maximo(X, [[A,B]|T], MAX).