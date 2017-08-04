-module(space_age).

-export([ageOn/2, test_version/0]).

ageOn(earth, Seconds) ->
  Seconds / 60 / 60 / 24 / 365.25;

ageOn(mercury, Seconds) ->
  ageOn(earth, Seconds) / 0.2408467;

ageOn(venus, Seconds) ->
  ageOn(earth, Seconds) / 0.61519726;

ageOn(mars, Seconds) ->
  ageOn(earth, Seconds) / 1.8808158;

ageOn(jupiter, Seconds) ->
  ageOn(earth, Seconds) / 11.862615;

ageOn(saturn, Seconds) ->
  ageOn(earth, Seconds) / 29.447498;

ageOn(uranus, Seconds) ->
  ageOn(earth, Seconds) / 84.016846;

ageOn(neptune, Seconds) ->
  ageOn(earth, Seconds) / 164.79132.

test_version() -> 1.
