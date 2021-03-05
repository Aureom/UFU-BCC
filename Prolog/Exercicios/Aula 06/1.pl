:- use_module(library(clpb)).

% Cafajeste = 0, Cavaleiro = 1

% 1-A       A diz:  ”Ao menos um de nos  ́e cafajeste” (considerando A,B e C)
teste_1A([A,B,C]) :- 
    sat(A =:= A), 
    sat(A =:= card([1,2,3], [~A,~B,~C])), 
    labeling([A,B,C]).

% 1-B       A diz ”Todos somos cafajestes”; B diz ”Dois de n ́os somos cafajestes”, com A,B e C)
teste_1B([A,B,C]) :- 
    sat(A =:= (~A * ~B * ~C)), 
    sat(B =:= card([2], [~A,~B,~C])), 
    labeling([A,B,C]).

% 1-C       A diz: ”B  ́e cafajeste”, B diz:”A e C são do mesmo tipo”.  Determine C
teste_1C([A,B,C]) :- 
    sat(A =:= ~B), 
    sat(B =:= (A =:= C)), 
    labeling([A,B,C]).