-module(nucleotide_count).

-export([count/2, nucleotide_counts/1, test_version/0]).

count(Dna, N) ->
  case lists:member(N, ["A", "C", "G", "T"]) of
    true -> count(Dna, N, 0);
    false -> error("Invalid nucleotide")
  end.

count([], _, R) ->
  R;

count([H | T], N, R) when [H] == N ->
  count(T, N, R + 1);

count([_ | T], N, R) ->
  count(T, N, R).

nucleotide_counts(Dna) ->
  nucleotide_counts(Dna, [{"A", 0}, {"T", 0}, {"C", 0}, {"G", 0}]).

nucleotide_counts([], R) ->
  R;

nucleotide_counts([H | T], R) ->
  {_, C} = lists:keyfind([H], 1, R),
  NewR = lists:keyreplace([H], 1, R, {[H], C + 1}),
  nucleotide_counts(T, NewR).

test_version() -> 1.
