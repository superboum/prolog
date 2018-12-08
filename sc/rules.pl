dangerous(jumptown).

safe(D, A) :-
  \+ dangerous(D),
  \+ dangerous(A).

maxCargo(Cost, SCU, MaxUEC, CanBuy) :-
  CanBuy is min(SCU * 100, MaxUEC / Cost).

finalProfit(Bought, CostBuy, CostSell, Profit) :-
  Profit is Bought * (CostSell - CostBuy).

journey(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :-
  buy(Departure, Merchandise, CostBuy),
  sell(Arrival, Merchandise, CostSell),
  maxCargo(CostBuy, SCU, MaxUEC, CanBuy),
  finalProfit(CanBuy, CostBuy, CostSell, Profit).

twoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit) :-
  journey(Departure, Arrival, Merchandise1, CanBuy1, SCU, MaxUEC, Profit1),
  journey(Arrival, Departure, Merchandise2, CanBuy2, SCU, MaxUEC + Profit1, Profit2),
  Profit is Profit1 + Profit2.  

mostProfitableTwoWayTrip(SCU, MaxUEC, Sorted) :-
  findall((P,D,A,M1,M2,C1,C2), (twoWayTrip(D,A,M1,M2,C1,C2,SCU,MaxUEC,P), safe(D,A)), Res),
  sort(0, @>=, Res, Sorted).


include('sctrading.prolog').
