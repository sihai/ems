%% @author sihai
%% @doc @todo Add description to server.


-module(ems_ets_storage).

-include("server_config.hrl").
-include("message.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([init/1, new_topic/1, add/1, delete/1]).

%% ====================================================================
%% @spec
%% ====================================================================
TopicTable

%% ====================================================================
%% @spec
%% ====================================================================
init({server_config, _, _, _}) ->
	TopicTable = ets:new("ems_topic", set)
init(_Any) ->
		io:format("Please use record server_config, include file server_config.hrl~n").

%% ====================================================================
%% @spec
%% ====================================================================
add({ems_message, TopicName, Producer, Consumers, Content}) ->
	Topic = ets:lookup(TopicTable, TopicName),
	ets:insert_new(Topic#topic.table, #ems_message{topic = TopicName, producer = Producer, consumers = Consumers, content = Content});
add(_Any) -> 
	io:format("Wrong message~n").

delete({ems_message, TopicName, Producer, Consumers, Content}) ->
	Topic = ets:lookup(TopicTable, TopicName),
	ets:delete(Topic#topic.table, Key).				   

new_topic({ems_topic, Name, _, Producers, Consumers, Messages}) ->
	Table = ets:new(Name, set),
	ets:insert_new(TopicTable, #ems_topic{name = Name, table = Table, producers = Producers, consumers = Consumers, messages = Messages}).
%% ====================================================================
%% Internal functions
%% ====================================================================

%% ====================================================================
%% @spec
%% ====================================================================

%% ====================================================================
%% @spec
%% ====================================================================