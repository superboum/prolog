:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).

server(Port) :-
  http_server(http_dispatch, [ port(Port)]).

:- http_handler('/api/trip', trip_api, []).

trip_api(Request) :-
  http_parameters(
    Request,
    [
      scu(ISCU, [optional(true), integer ]),
      maxuec(IMaxUEC, [optional(true), integer]),
      departure(IDep, [optional(true), atom]),
      arrival(IArr, [optional(true), atom]),
      merchandise(IMerch, [optional(true), atom])
    ]),

  format('Content-type: application/csv~n~n', []),
  desc(
    (P, IDep, IArr, IMerch, C, ISCU, IMaxUEC),
    0,
    (
      trip(IDep, IArr, IMerch, C, ISCU, IMaxUEC, P),
      maximize(P),
      maximize(C)
    ),
    Res),

  format('departure, arrival, merchandise, canbuy, scu, maxuec, profit~n', []),
  forall(
    member((Profit, Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC), Res),
    format('~w, ~w, ~w, ~f, ~d, ~d, ~f ~n', [Departure, Arrival, Merchandise, CanBuy, SCU, MaxUEC, Profit])
  ).
