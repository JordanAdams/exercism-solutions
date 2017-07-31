-module(leap).

-export([leap_year/1, test_version/0]).

leap_year(Year) ->
  if (Year rem 400) == 0 -> true
   ; (Year rem 100) == 0 -> false
   ; (Year rem 4)   == 0 -> true
   ; true                -> false
  end.

test_version() ->
  1.
