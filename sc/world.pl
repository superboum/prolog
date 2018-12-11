:- use_module(library(clpr)).
:- use_module(library(clpfd)).

dangerous(jumptown).

safe(Place, dangerous) :- place(Place), dangerous(Place).
safe(Place, safe) :- place(Place), \+ dangerous(Place).

safety(safe, safe, safe).
safety(_, dangerous, dangerous).
safety(dangerous, _, dangerous).

buyableCargo(Cost, SCU, MaxUEC, CanBuy) :-
  {
    CanBuy =< SCU * 100,
    CanBuy =< MaxUEC / Cost,
    Cost >= 0, MaxUEC >= 0, SCU >= 0, CanBuy >= 0
  }.

expectableProfit(Bought, CostBuy, CostSell, Profit) :-
  {
    Profit = Bought * (CostSell - CostBuy),
    Bought >= 0, CostSell >= 0, CostBuy >= 0
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

journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit)], 0) :-
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit).

journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) | Prev], Counter) :-
  Prev = [(Arrival, _, _, _, SCU, MaxUEC, _) | _],
  OldCounter #= Counter - 1,
  journey(Prev, OldCounter),
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
  \+ member((Departure, Arrival, _, _, _, _, _), Prev).
  

