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

tripSafety(Departure, Arrival, Safe) :-
  safe(Departure, Safe1),
  safe(Arrival, Safe2),
  safety(Safe1, Safe2, Safe).

tripProfit(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :- 
  desc(
    (Profit, Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC),
    (
      trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
      maximize(Profit),
      maximize(CanBuy)
    )).

% 1. use distinct to select only trips that are the most profitable for each D, A couples.
% 2. Try to replace atoms by strings
% 3. First create circle journeys with place(X) only.
% 4. Then add the (buy, sell) dependency, maybe with a cut to restrict possibilities.
% 5. Then map the merchandise and its quantity to buy for every hops.

journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit)], 0) :-
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit), maximize(Profit).

journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) | Next], Hops) :-
  OldCounter #= Hops - 1,
  Hops #> 0,
  Next = [(Arrival, _, _, _, SCU, MaxUEC, _) | _],
  journey(Next, OldCounter),
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
  \+ member((Departure, _, _, _, _, _, _), Next),
  \+ member((_, Arrival, _, _, _, _, _), Next).
  
circle_journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) | Next], Hops) :-
  journey([(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) | Next], Hops),
  last(Next, (_, Departure, _, _, _, _, _)).
