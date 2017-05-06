article(cette, feminin).
article(une, feminin).

article(ce, masculin).
article(un, masculin).

article(chaque, neutre).

mot(bouteille, feminin).
mot(robe, feminin).

mot(gout, masculin).
mot(vin, masculin).
mot(millésime, masculin).

adjectif(beau, masculin, apres).
adjectif(rond, masculin, apres).
adjectif(fruité, masculin, apres).
adjectif(élégant, masculin, apres).

adjectif(honnête, neutre, apres).
adjectif(agréable, neutre, apres).
adjectif(pourpre, neutre, apres).
adjectif(grandiose, neutre, apres).

adjectif(élégante, feminin, apres).
adjectif(belle, feminin, apres).
adjectif(ronde, feminin, apres).
adjectif(fruitée, feminin, apres).

verbe(possède, 3).
verbe(distille, 3).
verbe(a, 3).

syntagme_nominal(X, Y) :-
  (article(A, X); article(A, neutre)),
  mot(B, X),
  atomic_list_concat([A, B], ' ', Y).

syntagme_nominal(X, Y) :-
  (article(A, X); article(A, neutre)),
  mot(B, X),
  (adjectif(C, X, apres); adjectif(C, neutre, apres)),
  atomic_list_concat([A, B, C], ' ', Y).

syntagme_verbal(_, Y) :-
  verbe(Y, 3).

syntagme_verbal(X, Y) :-
  verbe(A, 3),
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
