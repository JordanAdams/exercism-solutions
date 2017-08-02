-module(bob).

-export([response_for/1, test_version/0]).

response_for(Input) ->
  IsQuestion = is_question(Input),
  IsSilence  = is_silence(Input),
  IsShouting = is_shouting(Input),

  if IsShouting -> "Whoa, chill out!"
   ; IsQuestion -> "Sure."
   ; IsSilence  -> "Fine. Be that way!"
   ; true       -> "Whatever."
  end.

is_question(Input) ->
  case re:run(Input, "\\?$") of
    {match, _} -> true ;
    _          -> false
  end.

is_silence(Input) ->
  case re:run(Input, "^[\s]*$") of
    {match, _} -> true ;
    _          -> false
  end.

is_shouting(Input) ->
  string:to_upper(Input) == Input.

test_version() ->
  1.
