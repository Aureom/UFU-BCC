supercrescente([X,Y|Z], Total) :- % supercrescente([3,4,8,50], 0).
    Y >= X+Total,
    length(Z, Size), Size == 0 % Passou tudo é supercrescente
    ;
    supercrescente([Y|Z], X+Total). % Continua no loop