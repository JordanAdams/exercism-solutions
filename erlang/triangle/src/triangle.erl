-module(triangle).

-export([kind/3, test_version/0]).

kind(A, B, C) when (A =< 0) or (B =< 0) or (C =< 0) ->
  {error, "all side lengths must be positive"};

kind(A, B, C) when (A + B =< C) or (A + C =< B) or (B + C =< A) ->
  {error, "side lengths violate triangle inequality"};

kind(_A, _A, _A) ->
  equilateral;

kind(_A, _A, _B) ->
  isosceles;

kind(_B, _A, _A) ->
  isosceles;

kind(_A, _B, _A) ->
  isosceles;

kind(_A, _B, _C) ->
  scalene.

test_version() -> 1.
