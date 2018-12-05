% Port Olisar
buy(portOlisar, medicalSupplies, 17.01).
buy(portOlisar, waste, 0.005).
sell(portOlisar, agricium, 25.60).
sell(portOlisar, aluminum, 1.25).
sell(portOlisar, beryl, 4.26).

% Grim Hex
sell(grimHex, medicalSupplies, 18.00).
sell(grimHex, waste, 0.010).

% ArcCorp157
sell(arcCorp157, medicalSupplies, 18.05).

journey(Departure, Arrival, Merchandise, Profit) :-
  buy(Departure, Merchandise, C1),
  sell(Arrival, Merchandise, C2),
  Profit is C2 - C1.
