%% @author sihai
%% @doc @todo Add description to server.


-module(ems_server).

-include("server_config.hrl").
-include("ems_message.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/1, request/2]).

%% ====================================================================
%% @spec
%% ====================================================================
start(Config) when is_record(Config, server_config) ->
		init(Config),
		process();
start(_Any) ->
		io:format("Please use record server_config, include file include/server_config.hrl~n").

%% ====================================================================
%% @spec
%% ====================================================================
request(Server, Request) ->
	Server ! {self(), Request},
	receive
		{Server, succeed, Response} -> Response;
		{Server, failed, Why} -> io:format("Server ~p process ~p failed ~n caused exception ~p~n",
										   [Server, Request, Why])
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================

%% ====================================================================
%% @spec
%% ====================================================================
init(#server_config{name = Name} = _Config) ->
	Pid = spawn(process()),
	register(Name, Pid).

%% ====================================================================
%% @spec
%% ====================================================================
process() ->
	receive
		{become, F} -> F()
	end.