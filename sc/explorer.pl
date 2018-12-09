allsorted(Match, SortPos, SortOrder, Rules, Res) :- 
  findall(Match, Rules, IntRes), 
  sort(SortPos, SortOrder, IntRes, Res).

desc(Match, SortPos, Rules, Res) :- allsorted(Match, SortPos, @>=, Rules, Res).
asc(Match, SortPos, Rules, Res) :- allsorted(Match, SortPos, @=<, Rules, Res).
best(Match, SortPos, Rules, Res) :- desc(Match, SortPos, Rules, [Res | _]).
worst(Match, SortPos, Rules, Res) :- asc(Match, SortPos, Rules, [Res | _]).
