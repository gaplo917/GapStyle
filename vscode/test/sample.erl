%%% Module fact documentation
-module(fact).
-export([fac/1]).

-record(state, {id, name}).

-define(MACRO, macro_value).

-type in() :: ok | hello .
-type out() :: ok | {error, term()}.

%% Factorial implementation
%% @doc Documentation
fac(0) -> 1;
fac(N) when N > 0, is_integer(N) -> N * fac(N-1).

string_sample(A) -> "string
  second line".

update_state(State) -> State#state{id=10}.

-spec simple(in())-> out(). 
simple(ok) -> ok.

use_macro() -> io:format(?MACRO).

-callback start_service() -> {ok, pid()}.