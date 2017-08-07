-module(allergies).

-export([is_allergic_to/2, allergies/1, test_version/0]).

is_allergic_to(Allergy, Score) ->
  lists:member(Allergy, allergies(Score)).

allergies(Score) ->
  allergies(Score, []).

allergies(Score, Allergies) when (Score >= 128) ->
  case lists:member('cats', Allergies) of
    true  -> allergies(Score - 128);
    false -> allergies(Score - 128, ['cats' | Allergies])
  end;

allergies(Score, Allergies) when (Score >= 64) ->
  case lists:member('pollen', Allergies) of
    true  -> allergies(Score - 64);
    false -> allergies(Score - 64, ['pollen' | Allergies])
  end;

allergies(Score, Allergies) when (Score >= 32) ->
  case lists:member('chocolate', Allergies) of
    true  -> allergies(Score - 32);
    false -> allergies(Score - 32, ['chocolate' | Allergies])
  end;

allergies(Score, Allergies) when (Score >= 16) ->
  case lists:member('tomatoes', Allergies) of
    true  -> allergies(Score - 16);
    false -> allergies(Score - 16, ['tomatoes' | Allergies])
  end;

allergies(Score, Allergies) when (Score >= 8) ->
  case lists:member('strawberries', Allergies) of
    true  -> allergies(Score - 8);
    false -> allergies(Score - 8, ['strawberries' | Allergies])
  end;

allergies(Score, Allergies) when (Score >= 4) ->
  case lists:member('shellfish', Allergies) of
    true  -> allergies(Score - 4);
    false -> allergies(Score - 4, ['shellfish' | Allergies])
  end;

allergies(Score, Allergies) when (Score >= 2) ->
  case lists:member('peanuts', Allergies) of
    true  -> allergies(Score - 2);
    false -> allergies(Score - 2, ['peanuts' | Allergies])
  end;

allergies(Score, Allergies) when (Score >= 1) ->
  case lists:member('eggs', Allergies) of
    true  -> allergies(Score - 1);
    false -> allergies(Score - 1, ['eggs' | Allergies])
  end;

allergies(_Score, Allergies) ->
  Allergies.

test_version() -> 1.
