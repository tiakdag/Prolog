ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
ancestor(X,X).
parent(amy,bob).


 
membst(X,node(X,T1,T2)).
membst(X,node(Y,T1,T2)) :- X < Y, membst(X,T1).
membst(X,node(Y,T1,T2)) :- X > Y, membst(X,T2).
