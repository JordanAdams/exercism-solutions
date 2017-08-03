-module(bob).

-export([response_for/1, test_version/0]).

response_for([]) -> "Fine. Be that way!";

response_for(Statement) ->
    [LastCharacter | _] = lists:reverse(Statement),
    UpperCaseResult = is_uppercase(Statement),
    StrippedResult = string:strip(Statement) =:= [],

    if
        StrippedResult -> "Fine. Be that way!";
        [LastCharacter] == "?" -> "Sure.";
        UpperCaseResult == true -> "Whoa, chill out!";
        true -> "Whatever."
    end.

is_uppercase(Statement) ->
    (string:to_upper(Statement) == Statement) andalso is_re_match(re:run(Statement, "[A-Z]+")).

is_re_match({match,_}) -> true;
is_re_match(_) -> false.

% response_for(Input) ->
%   IsQuestion = is_question(Input),
%   IsSilence  = is_silence(Input),
%   IsShouting = is_shouting(Input),
%
%   if IsSilence  -> "Fine. Be that way!"
%    ; IsShouting -> "Whoa, chill out!"
%    ; IsQuestion -> "Sure."
%    ; true       -> "Whatever."
%   end.
%
% is_question(Input) ->
%   case re:run(Input, "\\?$") of
%     {match, _} -> true ;
%     _          -> false
%   end.
%
% is_silence(Input) ->
%   case re:run(Input, "^[\s]*$") of
%     {match, _} -> true ;
%     _          -> false
%   end.
%
% is_shouting(Input) ->
%   case re:run(Input, "^[^a-z]+$") of
%     {match, _} -> true ;
%     _          -> false
%   end.

test_version() ->
  1.
