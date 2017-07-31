-module(collatz_conjecture).

-export([steps/1, test_version/0]).

steps(N) when (N < 0) ->
  {error, "Only strictly positive numbers are allowed"};

steps(N) ->
  steps(N, 0).

steps(1, Steps) ->
  Steps;

steps(N, Steps) ->
  case N rem 2 of
    0 -> steps(N div 2, Steps + 1) ;
    _ -> steps(N * 3 + 1, Steps + 1)
  end.

test_version() ->
  1.
