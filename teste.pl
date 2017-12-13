:- [sensor].
:- [flag].
:- [condicoes].

findworst([], [ok, 0]).
findworst([[A, B]|T], Bad) :-
    findworst(T, [C, D]),
    (B > D -> Bad = [A, B]; Bad = [C, D]).

getstatus(X) :-
    updateflags(),
    findall([Cond, Value], condicao(Cond, Value), Conds),
    findworst(Conds, X).
