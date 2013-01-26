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

MODS = framework plugin storage

all:compile

compile: ${MODS:%=%.beam} subdirs

subdirs:
	cd framework; make
	cd plugin; make
	cd storage; make