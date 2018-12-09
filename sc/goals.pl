notMostProfitableTrip(SCU, MaxUEC, Profit) :-
  trip(_, _, _, _, SCU, MaxUEC, ConcProfit),
  maximize(ConcProfit),
  Profit < ConcProfit.

mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :-
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
  maximize(Profit),
  \+ notMostProfitableTrip(SCU, MaxUEC, Profit).

% @FIXME: wrong result
mostProfitableTwoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit) :-
  twoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit),
  twoWayTrip(ConcD, ConcA, ConcM1, ConcM2, _, _, SCU, MaxUEC, ConcP1, ConcP2, ConcFP),
  (Departure \= ConcD ; Arrival \= ConcA ; Merchandise1 \= ConcM1 ; Merchandise2 \= ConcM2),     
  maximize(Profit1), maximize(Profit2),                                                            
  maximize(ConcP1), maximize(ConcP2),                                           
  { FinalProfit > ConcFP },
  !.                                                                              

