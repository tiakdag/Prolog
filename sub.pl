%covers see if its covered in the thing

subseq([],[]).
subseq([Item | RestX], [Item | RestY]) :-
	subseq(RestX,RestY).
subseq(X, [_ | RestY]) :-
	subseq(X,RestY).

% a single element contained in the set
cover([],0).
cover([Item | RestX],X) :- member(X,Item).
cover([Item | RestX],X) :- not(member(X,Item)),
	cover(RestX,X).
% are the list elements in the set of sets
covers(Set,[]).
covers(Set, [ListStr| RestList]):- 
	cover(Set,ListStr),
	covers(Set, RestList).

coverDecision(Set,Subsets, Goal, Cover) :-
subseq(Cover, Subsets),
length(Cover, N),
N =< Goal,
covers(Cover, Set).

num(0).
num(X):- num(Y), X is Y+1.

coverOptimization(Set,Subsets, Cover):-
	coverOptHelp(Set,Subsets, 1, Cover).
coverOptHelp(Set,Subsets, Num, Cover) :-
	coverDecision(Set,Subsets,Num,Cover),
	!.
coverOptHelp(Set,Subsets,Num, Cover) :-
	Z is Num+1,
	coverOptHelp(Set,Subsets,Z,Cover).	
coverOptHelp(Set,Subsets, Num, Cover) :-
	length(Subsets,X),
	X > Num+1,
	!.





