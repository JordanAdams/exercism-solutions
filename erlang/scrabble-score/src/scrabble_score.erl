-module(scrabble_score).

-export([score/1, test_version/0]).

score(Word) when is_list(Word) ->
  score(string:to_upper(Word), 0).

score([], Score) ->
  Score;

score([Char | Tail], Score) ->
  score(Tail, Score + score_char(Char)).

score_char($A) ->
  1;

score_char($E) ->
  1;

score_char($I) ->
  1;

score_char($O) ->
  1;

score_char($U) ->
  1;

score_char($L) ->
  1;

score_char($N) ->
  1;

score_char($R) ->
  1;

score_char($S) ->
  1;

score_char($T) ->
  1;

score_char($D) ->
  2;

score_char($G) ->
  2;

score_char($B) ->
  3;

score_char($C) ->
  3;

score_char($M) ->
  3;

score_char($P) ->
  3;

score_char($F) ->
  4;

score_char($H) ->
  4;

score_char($V) ->
  4;

score_char($W) ->
  4;

score_char($Y) ->
  4;

score_char($K) ->
  5;

score_char($J) ->
  8;

score_char($X) ->
  8;

score_char($Q) ->
  10;

score_char($Z) ->
  10.

test_version() -> 1.
