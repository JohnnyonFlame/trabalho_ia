:- dynamic(sensor(_, _)).
:- dynamic(estado(_)).

sensor(temp, 37.4).
sensor(pressure, [12,8]).
sensor(hb, 110).
sensor(glicose, 199).
estado(running).

report(Sensor, Value) :-
    (sensor(Sensor, Y) -> retract(sensor(Sensor, Y))),
    assert(sensor(Sensor, Value)).

