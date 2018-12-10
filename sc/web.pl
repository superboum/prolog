:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).

server(Port) :-
  http_server(http_dispatch, [ port(Port)]).

:- http_handler('/api/trip', trip_api, []).
:- json_object tripobj(
  departure:string,
  arrival:string,
  merchandise:string,
  canbuy:float,
  scu:float,
  maxuec:float,
  profit:float).
:- json_object ltripobj(res:[tripobj/7]).

trip_api(Request) :-
  http_parameters(
    Request,
    [
      scu(SCU, [optional(true), integer ]),
      maxuec(MaxUEC, [optional(true), integer]),
      departure(Departure, [optional(true), atom]),
      arrival(Arrival, [optional(true), atom]),
      merchandise(Merchandise, [optional(true), atom]),
      profit(Profit, [optional(true), float]),
      canbuy(CanBuy, [optional(true), integer])
    ]),

  mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit),
  atom_string(Departure, SDeparture),
  atom_string(Arrival, SArrival),
  atom_string(Merchandise, SMerchandise),
  %prolog_to_json(tripobj(SDeparture, SArrival, SMerchandise, CanBuy, SCU, MaxUEC, Profit), JSONOut),
  prolog_to_json(ltripobj([tripobj("test", "test", "test", 5.0, 4.0, 100.0, 23.0)]), JSONOut),
  %prolog_to_json(circle(coord(3.4, 5.6)), JSONOut),
  reply_json(JSONOut).
