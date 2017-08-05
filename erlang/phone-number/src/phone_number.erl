-module(phone_number).

-export([number/1, areacode/1, pretty_print/1, test_version/0]).

number(String) when length(String) < 10 ->
  "0000000000";

number([$1 | _] = String) when length(String) == 11 ->
  number(string:substr(String, 2, 10));

number(String) when length(String) == 11 ->
  "0000000000";

number(String) ->
  normalize(String).

areacode(String) ->
  {AreaCode, _, _} = parts(String),
  AreaCode.

pretty_print(String) ->
  {AreaCode, ExchangeCode, SubscriberNumber} = parts(String),
  lists:flatten(["(", AreaCode, ")", " ", ExchangeCode, "-", SubscriberNumber]).

parts(String) ->
  Normalized = normalize(String),
  AreaCode = string:substr(Normalized, 1, 3),
  ExchangeCode = string:substr(Normalized, 4, 3),
  SubscriberNumber = string:substr(Normalized, 7, 4),
  {AreaCode, ExchangeCode, SubscriberNumber}.

normalize(String) ->
  Numbers = [C || C <- String, is_numeric(C) ],
  lists:reverse(string:substr(lists:reverse(Numbers), 1, 10)).

is_numeric(Char) ->
  (Char >= $0) and (Char =< $9).

test_version() -> 1.
