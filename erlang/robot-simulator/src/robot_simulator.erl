-module(robot_simulator).
-behaviour(gen_server).

-export([advance/1,
         control/2,
         create/0,
         direction/1,
         left/1,
         right/1,
         place/3,
         position/1,
         test_version/0]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).


% External API

create() ->
  {ok, Pid} = gen_server:start_link(?MODULE, [], []),
  Pid.

advance(Robot) ->
  gen_server:cast(Robot, advance).

control(Robot, [$R | Tail]) ->
  right(Robot),
  control(Robot, Tail);

control(Robot, [$L | Tail]) ->
  left(Robot),
  control(Robot, Tail);

control(Robot, [$A | Tail]) ->
  advance(Robot),
  control(Robot, Tail);

control(Robot, [_ | Tail]) ->
  control(Robot, Tail);

control(_Robot, []) ->
  nil.

direction(Robot) ->
  gen_server:call(Robot, direction).

left(Robot) ->
  gen_server:cast(Robot, left).

right(Robot) ->
  gen_server:cast(Robot, right).

place(Robot, Direction, Position) ->
  gen_server:cast(Robot, {place, Direction, Position}).

position(Robot) ->
  gen_server:call(Robot, position).


% GenServer Callbacks

init([]) ->
  {ok, {undefined, {undefined, undefined}}}.

handle_call(direction, _From, {Direction, _} = State) ->
  {reply, Direction, State};

handle_call(position, _From, {_, Position} = State) ->
  {reply, Position, State}.

handle_cast({place, Direction, Position}, _State) ->
  {noreply, {Direction, Position}};

handle_cast(left, {Direction, Position}) ->
  case Direction of
    north -> {noreply, {west, Position}};
    west  -> {noreply, {south, Position}};
    south -> {noreply, {east, Position}};
    east  -> {noreply, {north, Position}}
  end;

handle_cast(right, {Direction, Position}) ->
  case Direction of
    north -> {noreply, {east, Position}};
    east  -> {noreply, {south, Position}};
    south -> {noreply, {west, Position}};
    west  -> {noreply, {north, Position}}
  end;

handle_cast(advance, {Direction, {X, Y}}) ->
  case Direction of
    north -> {noreply, {Direction, {X, Y + 1}}};
    east  -> {noreply, {Direction, {X + 1, Y}}};
    south -> {noreply, {Direction, {X, Y - 1}}};
    west  -> {noreply, {Direction, {X - 1, Y}}}
  end.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_, _) ->
  ok.

code_change(_, State, _) ->
  {ok, State}.

test_version() -> 1.
