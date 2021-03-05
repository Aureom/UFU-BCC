:- use_module(library(clpb)).

resposta1(A,B,C) :- 
    sat(A =:= (A * B * C)), 
    sat(B =:= card([1], [A,B,C])), 
    sat(C =:= (~A * ~B * ~C)), 
    labeling([A,B,C]).

resposta2(A,B,C) :- 
    sat((A =:= ~A) * (B =:= A) * (C =:= B)),
    labeling([A,B,C]).


% 1-C       A diz: ”B  ́e cafajeste”, B diz:”A e C são do mesmo tipo”.  Determine C
teste_1C([A,B,C]) :- sat(A =:= ~B), sat(B =:= (A =:= C)), labeling([A,B,C]).