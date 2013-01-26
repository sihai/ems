#===========================================================
#					EMS
#						Erlang Message System
#===========================================================

.SUFFIXES: .erl .beam .yrl

.erl .beam
	erlc -W $<

.yrl .erl
	erlc -W $<

ERL = erl -boot start_clean

all:compile

compile: ${MODS:%=%.beam}