% Port Olisar
buy(portOlisar, medicalSupplies, 17.01).
buy(portOlisar, waste, 0.005).
sell(portOlisar, agricium, 25.60).
sell(portOlisar, aluminum, 1.25).
sell(portOlisar, beryl, 4.26).
sell(portOlisar, chlorine, 1.57).
sell(portOlisar, corundum, 2.53).
sell(portOlisar, diamond, 6.90).
sell(portOlisar, distilledSpirits, 4.95).
sell(portOlisar, fluorine, 2.80).
sell(portOlisar, gold, 6.07).
sell(portOlisar, hydrogen, 1.02).
sell(portOlisar, iodine, 0.41).
sell(portOlisar, laranite, 28.19).
sell(portOlisar, processedFood, 1.39).
sell(portOlisar, quartz, 1.44).
sell(portOlisar, scrap, 1.67).
sell(portOlisar, stims, 3.40).
sell(portOlisar, titanium, 8.27).
sell(portOlisar, tungsten, 3.90).

% Grim Hex
sell(grimHex, agricium, 25.60).
sell(grimHex, altruciatoxine, 11.63).
sell(grimHex, aluminum, 1.25).
sell(grimHex, beryl, 4.26).
sell(grimHex, chlorine, 1.56).
sell(grimHex, corundum, 2.53).
sell(grimHex, diamond, 6.90).
sell(grimHex, distilledSpirits, 4.95).
sell(grimHex, fluorine, 2.80).
sell(grimHex, gold, 6.07).
sell(grimHex, hydrogen, 1.02).
sell(grimHex, iodine, 0.41).
sell(grimHex, laranite, 28.55).
sell(grimHex, medicalSupplies, 18.00).
sell(grimHex, processedFood, 1.38).
sell(grimHex, quartz, 1.44).
sell(grimHex, scrap, 1.70).
sell(grimHex, stims, 3.40).
sell(grimHex, titanium, 8.27).
sell(grimHex, tungsten, 3.90).
sell(grimHex, waste, 0.010).
sell(grimHex, widow, 24.0).

% ArcCorp157
sell(arcCorp157, altruciatoxine, 11.80).
buy(arcCorp157, chlorine, 1.44).
sell(arcCorp157, distilledSpirits, 4.95).
buy(arcCorp157, fluorine, 2.62).
buy(arcCorp157, hydrogen, 0.97).
buy(arcCorp157, iodine, 0.34).
sell(arcCorp157, medicalSupplies, 18.05).
sell(arcCorp157, processedFood, 1.36).
sell(arcCorp157, stims, 3.40).
buy(arcCorp157, waste, 0.005).
sell(arcCorp157, widow, 24.0).

% Benson Mining Outpost
sell(benson, altruciatoxine, 11.80).
buy(benson, chlorine, 1.44).
sell(benson, distilledSpirits, 4.95).
buy(benson, fluorine, 2.62).
buy(benson, hydrogen, 0.97).
buy(benson, iodine, 0.34).
sell(benson, medicalSupplies, 17.91).
sell(benson, processedFood, 1.36).
sell(benson, stims, 3.40).
buy(benson, waste, 0.005).
sell(benson, widow, 24.0).

% Deakins Research Outpost
buy(deakins, agri, 1.14).
sell(deakins, chlorine, 1.56).
sell(deakins, distilledSpirits, 4.95).
sell(deakins, fluorine, 2.85).
sell(deakins, iodine, 0.44).
buy(deakins, medicalSupplies, 17.0).
sell(deakins, processedFood, 1.37).
buy(deakins, waste, 0.005).

% Jumptown
% Not included yet because too dangerous



journey(Departure, Arrival, Merchandise, Profit) :-
  buy(Departure, Merchandise, C1),
  sell(Arrival, Merchandise, C2),
  Profit is C2 - C1.

twoWayTrip(Departure, Arrival, Merch1, Merch2, Profit) :-
  journey(Departure, Arrival, Merch1, P1),
  journey(Arrival, Departure, Merch2, P2),
  Profit is P1 + P2.
