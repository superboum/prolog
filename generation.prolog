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

gn(X, Y) :-
  (article(X, A); article(neutre, A)),
  mot(X, B),
  atomic_list_concat([A, B], ' ', Y).

gn(X, Y) :-
  (article(X, A); article(neutre, A)),
  mot(X, B),
  (adjectif(apres, X, C); adjectif(apres, neutre, C)),
  atomic_list_concat([A, B, C], ' ', Y).
