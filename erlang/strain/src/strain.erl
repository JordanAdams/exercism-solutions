-module(strain).

-export([keep/2, discard/2, test_version/0]).

keep(Fn, List) ->
  keep(Fn, List, []).

keep(Fn, [], Result) ->
  lists:reverse(Result);

keep(Fn, [Head | Tail], Result) ->
  case Fn(Head) of
    true  -> keep(Fn, Tail, [Head | Result]) ;
    false -> keep(Fn, Tail, Result)
  end.

discard(Fn, List) ->
  keep(fun (X) -> not Fn(X) end, List).

test_version() ->
  1.
