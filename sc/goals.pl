mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :- 
  desc(
    (Profit, Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC),
    (
      trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
      maximize(Profit),
      maximize(CanBuy)
    )).

mostProfitableTwoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit) :-
  desc(
    (FinalProfit, Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2),
    (
      twoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit),
      maximize(FinalProfit)
    )).




