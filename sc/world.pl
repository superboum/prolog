:- use_module(library(clpr)).

dangerous(jumptown).

safe(D, A) :-
  \+ dangerous(D),
  \+ dangerous(A).

buyableCargo(Cost, SCU, MaxUEC, CanBuy) :-
  {
    CanBuy =< SCU * 100,
    CanBuy =< MaxUEC / Cost
  }.

expectableProfit(Bought, CostBuy, CostSell, Profit) :-
  {
    Profit = Bought * (CostSell - CostBuy)
  }.

trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :-
  buy(Departure, Merchandise, CostBuy),
  sell(Arrival, Merchandise, CostSell),
  buyableCargo(CostBuy, SCU, MaxUEC, CanBuy),
  expectableProfit(CanBuy, CostBuy, CostSell, Profit).

twoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit) :-
  trip(Departure, Arrival, Merchandise1, CanBuy1, SCU, MaxUEC, Profit1),
  trip(Arrival, Departure, Merchandise2, CanBuy2, SCU, MaxUEC + Profit1, Profit2),
  {
    FinalProfit = Profit1 + Profit2
  }.
