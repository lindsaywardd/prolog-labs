different([]).
different([X|Rest]) :- not(member(X,Rest)), different(Rest).


differentR([]).
differentR([X|Rest]) :- different(X), differentR(Rest).


flattenL([],[]).
flattenL([X|Rest],F) :- flattenL(Rest,RestFlattened), append(X,RestFlattened,F).


myLength([],0).
myLength([_|Rest],Length) :- myLength(Rest,RestLength), Length is RestLength + 1.

% myLength([1], X)

add1([],[]).
add1([X|Rest],[Y|RestResult]) :- Y is X + 1, add1(Rest,RestResult).

% add1([1,2,3], X) 

addup([],[],[]).
addup([X|Rest1],[Y|Rest2],[Z|RestResult]) :- Z is X + Y, addup(Rest1,Rest2,RestResult).

% addup([1,2,3],[2,1,4],X). = Yes
% addup([1,2,3],[2,1,4],[3, 3, 7]). = Yes

