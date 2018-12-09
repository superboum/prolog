mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit) :-
  trip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),             % Our selected trip
  trip(ConcDep, ConcArrival, ConcMerch, _, SCU, MaxUEC, ConcProfit),              % Any concurrent trip
  (Departure \= ConcDep ; Arrival \= ConcArrival ; Merchandise \= ConcMerch),     % Any concurrent trip is different from our trip
  maximize(Profit),                                                               % We maximize our trip profit
  maximize(ConcProfit),                                                           % We maximize every other concurrent trip profit
  { Profit > ConcProfit },                                                        % Our profit is superior to any concurrent trip
  !.                                                                              % We prevent backtracking (not understood precisely why)

% @FIXME: wrong result
mostProfitableTwoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit) :-
  twoWayTrip(Departure, Arrival, Merchandise1, Merchandise2, CanBuy1, CanBuy2, SCU, MaxUEC, Profit1, Profit2, FinalProfit),
  twoWayTrip(ConcD, ConcA, ConcM1, ConcM2, _, _, SCU, MaxUEC, ConcP1, ConcP2, ConcFP),
  (Departure \= ConcD ; Arrival \= ConcA ; Merchandise1 \= ConcM1 ; Merchandise2 \= ConcM2),     
  maximize(Profit1), maximize(Profit2),                                                            
  maximize(ConcP1), maximize(ConcP2),                                           
  { FinalProfit > ConcFP },
  !.                                                                              

