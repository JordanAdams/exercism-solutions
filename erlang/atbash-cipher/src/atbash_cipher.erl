-module(atbash_cipher).

-export([encode/1, decode/1, test_version/0]).

encode(String) ->
  Encoded = [ encode_char(C) || C <- string:to_lower(String), is_encodable(C) ],
  Chunks = chunk(Encoded),
  string:join(Chunks, " ").

decode(String) ->
  [ encode_char(C) || C <- string:to_lower(String), is_encodable(C) ].

encode_char(C) when (C >= $a) and (C =< $z) ->
  $z - (C - $a);

encode_char(C) ->
  C.

is_encodable(C) ->
  if (C >= $0) and (C =< $9) -> true
   ; (C >= $a) and (C =< $z) -> true
   ; true                    -> false
  end.

chunk(List) when length(List) > 5 ->
  {L, R} = lists:split(5, List),
  [L | chunk(R)];

chunk(List) ->
  [List].

test_version() -> 1.
