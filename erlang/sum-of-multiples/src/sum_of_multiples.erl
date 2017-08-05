-module(sum_of_multiples).

-export([sumOfMultiples/2, test_version/0]).

sumOfMultiples(Multiples, N) ->
  Range = lists:seq(1, N - 1),
  Valid = lists:filter(fun (X) -> is_multiple(Multiples, X) end, Range),
  lists:sum(Valid).

is_multiple(Multiples, N) ->
  lists:any(fun (M) -> N rem M == 0 end, Multiples).

test_version() -> 1.
