-module(rna_transcription).

-export ([to_rna/1, test_version/0]).

to_rna(String) ->
  lists:map(fun transcribe_char/1, String).

transcribe_char(Char) ->
  case Char of
    $G -> $C;
    $C -> $G;
    $T -> $A;
    $A -> $U
  end.

test_version() ->
  1.
