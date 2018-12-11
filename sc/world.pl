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

journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit)], 0) :-
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit), maximize(Profit), maximize(CanBuy).

journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) | Next], Counter) :-
  OldCounter #= Counter - 1,
  Next = [(Arrival, _, _, _, SCU, MaxUEC, _) | _],
  journey(Next, OldCounter),
  maximize(Profit),
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
  \+ member((Departure, Arrival, _, _, _, _, _), Next).
  
circle_journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) | Next], Counter) :-
  journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) | Next], Counter),
  last(Next, (_, Departure, _, _, _, _, _)).

