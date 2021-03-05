p(1).
p(2).
p(3).
p(4).
p(5).
p(6).

move_cavalo([L1, C1], [L2, C2]) :- p(L1), p(L2), p(C1), p(C2), 1 =:= abs(L1-L2), 2 =:= abs(C1-C2),
								   p(L1), p(L2), p(C1), p(C2), 2 =:= abs(L1-L2), 1 =:= abs(C1-C2).

tour([], R) :- tour([[1,1]], R).
tour([H|T], R) :- 
                length([H|T], Tamanho), 
                write(Tamanho),
                Tamanho < 36, 
                move_cavalo(H, N), 
                write("3"), nl,
                write("Batata"),
                not(member(N, T)),
                append([N], [H|T], L2),
                write(L2), nl,
                tour(L2, R).
tour([H|T], [H|T]) :- length([H|T]) == 36.