% P01 (*): Find the last element of a list.

last(X,[X]).
last(X,[_|L]) :- last(X,L).