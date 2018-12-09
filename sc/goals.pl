notMostProfitableTrip(SCU, MaxUEC, Profit) :-
  trip(_, _, _, _, SCU, MaxUEC, ConcProfit),
  maximize(ConcProfit),
  Profit < ConcProfit.

mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :-
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
  maximize(Profit),
  \+ notMostProfitableTrip(SCU, MaxUEC, Profit).

notMostProfitableTwoWayTrip(SCU, MaxUEC, Profit) :-
  twoWayTrip(_,_,_,_,_,_,SCU,MaxUEC,_,_,ConcProfit),
  maximize(ConcProfit),
  Profit < ConcProfit.

mostProfitableTwoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit) :-
  twoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit),
  maximize(FinalProfit),
  \+ notMostProfitableTwoWayTrip(SCU, MaxUEC, FinalProfit).

