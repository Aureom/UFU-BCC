:- use_module(library(clpfd)).

/* 
--- 2.1 Representação do jogo --- 
    Espaço vazio = ⬜
    Cores = ⚪⚫🔴🔵🟠🟡🟢🟣🟤
---------------------------------
*/

novoJogo :- 
    gerarLyfoes(Board),
    jogar(Board).

% Coluna no lugar da linha (nivel 11 do jogo) [6] colunas, [4] linhas (Sempre 4 linhas)
% Aqui estamos presos em 6 colunas, mas podemos sempre adicionar mais colunas na matriz abaixo sem problemas
% e tambem criar novas fases modificando a matriz
%
% Mas o aqui invertemos as colunas com as linhas para facilitar a verificação
gerarLyfoes(Board) :- Board = [
                ['🟢','🔴','🔵','🟡'], 
                ['🔵','🟢','🔴','🟢'],
                ['🟡','🔴','🔴','🔵'], 
                ['🟡','🟢','🔵','🟡'],
                ['⬜','⬜','⬜','⬜'],
                ['⬜','⬜','⬜','⬜']
                ].

printLyfoes(Board) :- 
    nl,
    write(" 1 2 3 4 5 6 "), nl,
    printBoard(Board).
    
printBoard([]) :- !.
printBoard([Linha | ProxLinha]) :-
    printLinha(Linha), nl,
    printBoard(ProxLinha).

printLinha([]) :- !.
printLinha([H | T]) :- 
    write(H),
    printLinha(T).


/*
-------- "LOOP" DO JOGO -------- 
*/

jogar(Board) :-
    % Aqui realizamos a transposição da matriz para mostrar ela pro jogador
    transpose(Board, BoardPrint),
    printLyfoes(BoardPrint),
    (
    vitoria(Board)
    ) 
        -> nl, nl, write("   ***   Você ganhou!   ***   "), nl, nl
    ;
    write("Escolha uma coluna para tirar: "), nl,
    read(Input), ColunaEscolhidaTirar is Input - 1,
    write("Escolha uma coluna para colocar: "), nl,
    read(Input2), ColunaEscolhidaColocar is Input2 - 1,
    (
    ColunaEscolhidaTirar \== ColunaEscolhidaColocar,
    testarTirada(Board, ColunaEscolhidaTirar, ColunaTirar),
    write("passou tirada"), nl,
    primeiraPeca(ColunaTirar, PecaTirar),
    write("passou primeira peca"), nl,
    testarDestino(Board, ColunaEscolhidaColocar, PecaTirar),
    write("passou destino"), nl
    ) 
        -> % Passou todos os testes, jogada valida
        write("Jogada valida"), nl,
        retiraPeca(Board, ColunaEscolhidaTirar, PreNewBoard), 
        jogarPeca(PreNewBoard, ColunaEscolhidaColocar, PecaTirar, NewBoard),
        jogar(NewBoard)
    ; % Não passou, repete a jogada

    write("Jogada invalida"), nl,jogar(Board).

/*
---- 2.2 Verificação de jogada válida ----
*/

testarTirada(Board, ColunaEscolhidaTirar, ColunaTirar) :- 
    4 >= ColunaEscolhidaTirar, ColunaEscolhidaTirar >= 0,
    append(X, [ColunaTirar | _], Board),
    length(X, ColunaEscolhidaTirar),
    ColunaTirar \== ['⬜', '⬜', '⬜', '⬜'].
    %write(ColunaTirar), nl,
    %primeiraPeca(ColunaTirar, PecaTirar),
    %write(PecaTirar), nl.

primeiraPeca([Peca | _], Peca) :-
    Peca \== '⬜'.
primeiraPeca(['⬜' | Prox], Peca) :-
    nth0(0, Prox, PrePeca), PrePeca \== '⬜', Peca = PrePeca, write(Peca), nl
    ; 
    primeiraPeca(Prox, Peca).

testarDestino(Board, ColunaEscolhidaColocar, _) :- 
    5 >= ColunaEscolhidaColocar, ColunaEscolhidaColocar >= 0,
    append(X, [ColunaColocar | _], Board),
    length(X, ColunaEscolhidaColocar),
    ColunaColocar == ['⬜','⬜','⬜','⬜'].

testarDestino(Board, ColunaEscolhidaColocar, Peca) :- 
    5 >= ColunaEscolhidaColocar, ColunaEscolhidaColocar >= 0,
    append(X, [ColunaColocar | _], Board),
    length(X, ColunaEscolhidaColocar),
    primeiraPeca(ColunaColocar, Peca).
    %write(ColunaColocar), nl.

retiraPeca(Board, ColunaEscolhidaTirar, NewBoard) :-
    append(NColuna, [ColunaDestino | T], Board),
    length(NColuna, ColunaEscolhidaTirar),
    %write("PRE -> "), nl, write(ColunaDestino), nl,
    limpaPrimeiraPeca(ColunaDestino, ColunaAtualizada),
    %write("POS -> "), nl, write(ColunaAtualizada), nl,
    append(NColuna, [ColunaAtualizada| T], NewBoard).

jogarPeca(Board, ColunaEscolhidaColocar, Peca, NewBoard) :-
    append(NColuna, [ColunaDestino | T], Board),
    length(NColuna, ColunaEscolhidaColocar),
    atualizarColuna(ColunaDestino, Peca, ColunaAtualizada),
    append(NColuna, [ColunaAtualizada| T], NewBoard).

/*
---- 2.3 Atualizações no jogo ----
*/

atualizarColuna(['⬜'], Peca, [Peca]).
atualizarColuna([_, B | Prox], Peca, [Peca, B | Prox]) :-
    B \== '⬜'.
atualizarColuna(['⬜' | Prox], Peca, ['⬜' | Prox2]) :-
    atualizarColuna(Prox, Peca, Prox2).

limpaPrimeiraPeca(['⬜','⬜','⬜',_], ['⬜','⬜','⬜','⬜']).
limpaPrimeiraPeca(['⬜','⬜',_,D], ['⬜','⬜','⬜',D]).
limpaPrimeiraPeca(['⬜',_,C,D], ['⬜','⬜',C,D]).
limpaPrimeiraPeca([_,B,C,D], ['⬜',B,C,D]).

/*
----- 2.4. Checar vitória ----- 
*/

vitoria([_]) :- !.
vitoria([H | T]) :- 
    vitoriaColuna(H), vitoria(T).

vitoriaColuna([_]) :- !.
vitoriaColuna([X,X|T]) :- vitoriaColuna([X|T]).