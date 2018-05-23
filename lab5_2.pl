append2([],Y,Y).
append2([A|B],Y,[A|W]) :- append2(B,Y,W).

reverse1([],[]).
reverse1([H|T],L) :- reverse1(T,L1), append2(L1,[H],L).

last1([Y|[]],Y).
last1([H|T],L) :- last1(T,L).
