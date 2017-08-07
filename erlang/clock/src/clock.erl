-module(clock).

-export([create/2, is_equal/2, minutes_add/2, to_string/1, test_version/0]).

create(Hours, Minutes) ->
  {Hours, Minutes}.

is_equal(ClockA, ClockB) ->
  to_string(ClockA) == to_string(ClockB).

minutes_add({Hours, Minutes}, AddedMinutes) ->
  {Hours, Minutes + AddedMinutes}.

to_string({Hours, Minutes}) when (Hours >= 24) ->
  to_string({Hours - 24, Minutes});

to_string({NegativeHours, Minutes}) when (NegativeHours < 0) ->
  to_string({24 + NegativeHours, Minutes});

to_string({Hours, Minutes}) when (Minutes >= 60) ->
  to_string({Hours + 1, Minutes - 60});

to_string({Hours, NegativeMinutes}) when (NegativeMinutes < 0) ->
  to_string({Hours - 1, 60 + NegativeMinutes});

to_string({Hours, Minutes}) ->
  HourString = string:right(integer_to_list(Hours), 2, $0),
  MinutesString = string:right(integer_to_list(Minutes), 2, $0),
  string:join([HourString, MinutesString], ":").

test_version() -> 1.
