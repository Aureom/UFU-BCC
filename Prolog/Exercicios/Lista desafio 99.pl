% P01 (*): Find the last element of a list.
last(X,[X]).
last(X,[_|L]) :- last(X,L).

% P02 (*) Find the last but one element of a list.
penultimo([X,_], X).
penultimo([_,Cab|Rest], X) :- penultimo([Cab|Rest], X).

% P03 (*) Find the K'th element of a list. Pode ser feito usando o nth0, j? imbutido na linguagem
findInList(X, [X|_], 0).
findInList(X, [_|R], N) :- 
	N > 0, 
	I is N - 1, 
	findInList(X, R, I).
	
% P04 (*) Find the number of elements of a list.
listSize([], 0).
listSize([_|T], X) :- 
	listSize(T, I),
	X is I + 1.
	
% P05 (*) Reverse a list.
reverseList([], []).
reverseList([H|T], Reverse) :- reverse([H|T], Reverse).

% P06 (*) Find out whether a list is a palindrome.
isPalindrome(L) :- reverse(L, L).