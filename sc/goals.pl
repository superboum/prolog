notMostProfitableTrip(SCU, MaxUEC, Profit) :-
  trip(_, _, _, _, SCU, MaxUEC, ConcProfit),
  maximize(ConcProfit),
  Profit < ConcProfit.

mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :-
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
  maximize(Profit),
  \+ notMostProfitableTrip(SCU, MaxUEC, Profit).

notMostProfitableTwoWayTrip(Departure, Arrival, SCU, MaxUEC, Profit) :-
  twoWayTrip(Departure, Arrival,_,_,_,_,SCU,MaxUEC,_,_,ConcProfit),
  maximize(ConcProfit),
  safe(Departure,Arrival),
  Profit < ConcProfit.

mostProfitableTwoWayTrip(MyDeparture, MyArrival, AllowedDeparture, AllowedArrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit) :-
  twoWayTrip(MyDeparture, MyArrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit),
  maximize(FinalProfit),
  \+ notMostProfitableTwoWayTrip(AllowedDeparture, AllowedArrival, SCU, MaxUEC, FinalProfit).

mostProfitableTwoWayTrip2(MyDeparture, MyArrival, AllowedDeparture, AllowedArrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit) :-
  findall(
    (MaxProfit),
    (twoWayTrip(AllowedDeparture, AllowedArrival, _, _, _, _, SCU, MaxUEC, _, _, MaxProfit), maximize(MaxProfit)),
    PossibleProfits),
  sort(0, @>=, PossibleProfits, [FinalProfit | _]),
  maximize(FinalProfit),
  twoWayTrip(MyDeparture, MyArrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit).

% Both mostProfitableTwoWayTrip functions struggle to include constraints like `safe/2`
