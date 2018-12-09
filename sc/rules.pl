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

trip2(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :-
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
  trip(ConcDep, ConcArrival, ConcMerch, _, SCU, MaxUEC, ConcProfit),
  (Departure \= ConcDep ; Arrival \= ConcArrival ; Merchandise \= ConcMerch),
  { Profit > ConcProfit }.

twoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit) :-
  trip(Departure, Arrival, Merchandise1, CanBuy1, SCU, MaxUEC, Profit1),
  trip(Arrival, Departure, Merchandise2, CanBuy2, SCU, MaxUEC + Profit1, Profit2),
  {
    Profit = Profit1 + Profit2
  }.

mostProfitableTwoWayTrip(SCU, MaxUEC, Sorted) :-
  findall(
    (Profit,Departure,Arrival,Merch1,Merch2,Count1,Count2),
    (
      twoWayTrip(Departure,Arrival,Merch1,Merch2,Count1,Count2,SCU,MaxUEC,Profit),
      safe(Departure,Arrival),
      maximize(Profit)
    ), Res),
  sort(0, @>=, Res, Sorted).
