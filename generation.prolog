article(feminin, cette).
article(feminin, une).

article(masculin, ce).
article(masculin, un).

article(neutre, chaque).

mot(feminin, bouteille).
mot(feminin, robe).

mot(masculin, gout).
mot(masculin, vin).

adjectif(apres, masculin, beau).
adjectif(apres, masculin, rond).
adjectif(apres, masculin, fruité).

adjectif(apres, neutre, honnête).
adjectif(apres, neutre, agréable).
adjectif(apres, neutre, pourpre).

verbe(3, est).
verbe(3, possède).

syntagme_nominal(X, Y) :-
  (article(X, A); article(neutre, A)),
  mot(X, B),
  atomic_list_concat([A, B], ' ', Y).

syntagme_nominal(X, Y) :-
  (article(X, A); article(neutre, A)),
  mot(X, B),
  (adjectif(apres, X, C); adjectif(apres, neutre, C)),
  atomic_list_concat([A, B, C], ' ', Y).

syntagme_verbal(_, Y) :-
  verbe(3, Y).

syntagme_verbal(X, Y) :-
  verbe(3, A),
  syntagme_nominal(X, B),
  atomic_list_concat([A, B], ' ', Y).

phrase(X) :-
  syntagme_nominal(Y, A),
  syntagme_verbal(Y, B),
  atomic_list_concat([A, B], ' ', X).

gen :-
  findall(A, phrase(A), B),
  random_member(X, B),
  writeln(X).
