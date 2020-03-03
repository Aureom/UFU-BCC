% P01 (*): Find the last element of a list.
last(X,[X]).
last(X,[_|L]) :- last(X,L).

% P02 (*) Find the last but one element of a list.
penultimo([X,_], X).
penultimo([_,Cab|Rest], X) :- penultimo([Cab|Rest], X).

% P03 (*) Find the K'th element of a list. Pode ser feito usando o nth0, já imbutido na linguagem
findInList(X, [X|_], 0).
findInList(X, [_|R], N) :- 
	N > 0, 
	I is N - 1, 
	findInList(X, R, I).