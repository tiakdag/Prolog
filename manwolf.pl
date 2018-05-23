change(e,w).
change(w,e).

move([X,X,Goat,Cabbage],wolf,[Y,Y,Goat,Cabbage]) :-
  change(X,Y).
move([X,Wolf,X,Cabbage],goat,[Y,Wolf,Y,Cabbage]) :-
  change(X,Y).
move([X,Wolf,Goat,X],cabbage,[Y,Wolf,Goat,Y]) :-
  change(X,Y).
move([X,Wolf,Goat,C],nothing,[Y,Wolf,Goat,C]) :-
  change(X,Y).

oneEq(X,X,Y) :- (X = X, X\==Y).
oneEq(X,Y,X) :- (X = X, X\==Y).
oneEq(X,X,X).

%before oneEq(X,X,_).  oneEq(X,_,X).

safe([Man,Wolf,Goat,Cabbage]) :-
  oneEq(Man,Goat,Wolf),
  oneEq(Man,Goat,Cabbage).

solution([e,e,e,e],[]).
solution(Config,[Move|Rest]) :-
  move(Config,Move,NextConfig),
  safe(NextConfig),
  solution(NextConfig,Rest).
