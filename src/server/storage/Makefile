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

MODS = dets ets

all:compile

compile: ${MODS:%=%.beam} subdirs

subdirs:
	cd dets; make
	cd ets; make