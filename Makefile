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

MODS = client server

all:compile

compile: ${MODS:%=%.beam} subdirs

ems: compile
	${ERL} -s ems start

subdirs:
	cd src/client; make
	cd src/server; make