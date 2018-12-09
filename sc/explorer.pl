allsorted(Match, SortOrder, Rules) :- 
  findall(Match, Rules, IntRes), 
  sort(0, SortOrder, IntRes, Res),
  member(Match, Res).

desc(Match, Rules) :- allsorted(Match, @>=, Rules).
asc(Match, Rules) :- allsorted(Match, @=<, Rules).
best(Match, Rules) :- desc(Match, Rules), !.
worst(Match, Rules) :- asc(Match, Rules), !.
