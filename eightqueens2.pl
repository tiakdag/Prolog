nocheck(_, []).
nocheck(X/Y, [X1/Y1 | Rest]) :-
  % X =\= X1, assume the Xs are distinct
  Y =\= Y1,
  abs(Y1-Y) =\= abs(X1-X),
  nocheck(X/Y, Rest).

legal(P,[]).
legal(P,[X/Y | Rest]) :-
  legal(P,Rest),
  % member(X,Q), assume X in range
  member(Y,P),
  nocheck(X/Y,Rest).

/*
  eightqueens(X) succeeds if X is a legal
  placement of eight queens, listed in order
  of their X coordinates.
*/
eightqueens(X) :-
  X = [1/_,2/_,3/_,4/_,5/_,6/_,7/_,8/_],
  legal(X).


/*template takes a list checks if it is in x format
take a list check if it is in y  
*/

nqueens(X,N):-
 position(N,Y), 
 template(Y,X),
 legal(Y,X).

position(0,[]).
position(N,[N|Rest]) :- 
	N > 0,
	NewN is N-1,	
	position(NewN,Rest).


template([],[]).
template([N|Rest],[N/_|Rest1]) :-
	template(Rest,Rest1).


