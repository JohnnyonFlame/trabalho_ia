sensor_flag(temp, 0, Val) :-
    (estado(running) -> Min is 36.5, Max is 37.5;
	Min is 36.5, Max is 37),
    Val >= Min, Val < Max.

sensor_flag(temp, 1, Val) :-
    (estado(running) -> Min is 37.5, Max is 38; Min is 37, Max is 38),
    Val >= Min, Val < Max.

sensor_flag(temp, 2, Val) :-
    Val >= 38, Val < 40.

sensor_flag(glicose, 2, Val) :-
    Val >= 130, Val < 200.

sensor_flag(glicose, 3, Val) :-
    Val >= 200, Val < 400.

:- dynamic(flag(_,_)).

getflags(X) :-
    findall([S, F], (sensor(S, V), sensor_flag(S, F, V)), X).

cleanflags() :-
    forall(flag(F, V), retract(flag(F, V))).

setupflags([]).
setupflags([[Flag, Value]|T]) :-
    assert(flag(Flag, Value)),
    setupflags(T).

updateflags():-
    getflags(Flags),
    cleanflags(),
    setupflags(Flags).
