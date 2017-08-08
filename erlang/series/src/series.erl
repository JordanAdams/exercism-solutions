-module(series).

-export([from_string/2, test_version/0]).

from_string(Width, String) ->
  from_string(Width, String, []).

from_string(Width, String, Results) when length(String) < Width ->
  lists:reverse(Results);

from_string(Width, String, Results) ->
  [_ | Rest]  = String,
  ResultItem = lists:sublist(String, Width),
  from_string(Width, Rest, [ResultItem | Results]).


test_version() -> 1.
