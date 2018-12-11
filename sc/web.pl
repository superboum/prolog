:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_cors)).
:- use_module(library(http/json_convert)).

:- set_setting(http:cors, [*]).

server(Port) :-
  http_server(http_dispatch, [ port(Port)]).

:- http_handler('/api/object', object_api, []).
object_api(_) :-
  cors_enable,
  findall(Place, place(Place), Places),
  findall(Merchandise, merchandise(Merchandise), Merchandises),
  reply_json(r{place:Places, merchandise:Merchandises}).

:- http_handler('/api/trip', trip_api, []).

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
      canbuy(CanBuy, [optional(true), integer]),
      safety(Safe, [optional(true), atom])
    ]),
  cors_enable,

  findall(
    r{departure:Departure, arrival:Arrival, merchandise:Merchandise, canbuy:CanBuy, scu:SCU, maxuec:MaxUEC, profit:Profit, safety:Safe},
    mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit, Safe),
    Answers),
  reply_json(r{answers: Answers}).
