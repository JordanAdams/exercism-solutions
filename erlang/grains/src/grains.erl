-module(grains).

-export([square/1, total/0, test_version/0]).

square(N) ->
  lists:foldl(fun (_, R) -> R * 2 end, 1, lists:duplicate(N - 1, nil)).

total() ->
  lists:foldl(fun (_, R) -> R * 2 end, 1, lists:duplicate(64, nil)) - 1.

test_version() -> 1.
