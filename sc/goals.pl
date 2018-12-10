mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit, Safe) :- 
  desc(
    (Profit, Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Safe),
    (
      trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
      maximize(Profit),
      maximize(CanBuy),
      safe(Departure, Safe1),
      safe(Arrival, Safe2),
      safety(Safe1, Safe2, Safe)
    )).

mostProfitableTwoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit) :-
  desc(
    (FinalProfit, Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2),
    (
      twoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit),
      maximize(FinalProfit)
    )).




