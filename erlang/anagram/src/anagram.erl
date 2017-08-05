-module(anagram).

-export([find/2, test_version/0]).

find(Word, Candidates) ->
  lists:filter(fun (C) -> is_anagram(Word, C) end, Candidates).

is_anagram(Word, Candidate) ->
  A = string:to_lower(Word),
  B = string:to_lower(Candidate),
  SortedA = lists:sort(A),
  SortedB = lists:sort(B),

  if A == B             -> false
   ; SortedA == SortedB -> true
   ; true               -> false
  end.

test_version() -> 1.
