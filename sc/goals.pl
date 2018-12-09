mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :-
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),             % Our selected trip
  trip(ConcDep, ConcArrival, ConcMerch, _, SCU, MaxUEC, ConcProfit),              % Any concurrent trip
  (Departure \= ConcDep ; Arrival \= ConcArrival ; Merchandise \= ConcMerch),     % Any concurrent trip is different from our trip
  maximize(Profit),                                                               % We maximize our trip profit
  maximize(ConcProfit),                                                           % We maximize every other concurrent trip profit
  { Profit > ConcProfit }.                                                        % Our profit is superior to any concurrent trip

