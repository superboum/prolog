humain(quentin,23).
humain(toto,26).
humain(erwan,16).

test(A, B) :-
  A ; B.

fall(M,R,S,SP) :- findall(M,R,IS), sort(SP, @>=, IS, S).

tt(RR) :-
  findall((N,A), humain(N, A), R),
  sort(A, @>=, R, RR).
