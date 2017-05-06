%%%%%
% DICTIONNAIRE
%%%%%

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
adjectif(gourmand, masculin, apres).
adjectif(profond, masculin, apres).
adjectif(puissant, masculin, apres).

adjectif(honnête, neutre, apres).
adjectif(agréable, neutre, apres).
adjectif(pourpre, neutre, apres).
adjectif(grandiose, neutre, apres).

adjectif(élégante, feminin, apres).
adjectif(belle, feminin, apres).
adjectif(ronde, feminin, apres).
adjectif(fruitée, feminin, apres).
adjectif(gourmande, feminin, apres).
adjectif(profonde, feminin, apres).
adjectif(puissante, feminin, apres).

verbe(possède, 3).
verbe(distille, 3).
verbe(exprime, 3).
verbe(a, 3).

%%%%%
% LOGIQUE
%%%%%

syntagme_nominal(X, [A, B]) :-
  (article(A, X); article(A, neutre)),
  mot(B, X).

syntagme_nominal(X, [A, B, C]) :-
  (article(A, X); article(A, neutre)),
  mot(B, X),
  (adjectif(C, X, apres); adjectif(C, neutre, apres)).

syntagme_verbal(_, [Y]) :-
  verbe(Y, 3).

syntagme_verbal(X, [A|B]) :-
  verbe(A, 3),
  syntagme_nominal(X, B).

phrase(X) :-
  syntagme_nominal(_, A),
  syntagme_verbal(_, B),
  append(A, B, X).

gen :-
  findall(A, phrase(A), B),
  random_member(C, B),
  atomic_list_concat(C, ' ', D),
  writeln(D).
