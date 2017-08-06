-module(grade_school).

-export([add/3, get/2, sort/1, new/0, test_version/0]).

new() ->
  #{}.

add(Name, Grade, School) ->
  maps:put(Grade, [Name | get(Grade, School)], School).

get(Grade, School) ->
  lists:sort(maps:get(Grade, School, [])).

sort(School) ->
  Grades = lists:sort(maps:keys(School)),
  lists:map(fun (G) ->
    {G, get(G, School)}
  end, Grades).

test_version() -> 1.
