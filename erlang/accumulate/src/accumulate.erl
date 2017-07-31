-module(accumulate).

-export([accumulate/2, test_version/0]).

accumulate(Fn, List) ->
  accumulate(Fn, List, []).

accumulate(_Fn, [], Result) ->
  lists:reverse(Result);

accumulate(Fn, [Head | Tail], Result) ->
  accumulate(Fn, Tail, [Fn(Head) | Result]).

test_version() ->
  1.
