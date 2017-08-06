-module(word_count).

-export([count/1, test_version/0]).

count(String) ->
  count(words(String), dict:new()).

count([], Result) ->
  Result;

count([Word | Rest], Result) ->
  count(Rest, dict:update_counter(Word, 1, Result)).

words(String) ->
  string:tokens(normalize(String), " ").

normalize(String) ->
  Lowered = string:to_lower(String),
  re:replace(Lowered, "[^a-z0-9]", " ", [global, {return, list}]).


test_version() -> 1.
