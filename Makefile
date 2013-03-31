.PHONY: compile xref eunit clean doc check make deps

all: compile xref eunit

# for busy typos
m: all
ma: all
mak: all
make: all

deps:
	@./rebar get-deps
	@./rebar update-deps
#	@./rebar check-deps

compile: deps
	@./rebar compile

xref:
	@./rebar xref

eunit: compile
	@./rebar eunit skip_deps=true

clean:
	@./rebar clean

doc:
	@./rebar doc

check:
	@echo "you need ./rebar build-plt before make check"
# @./rebar build-plt
	@./rebar check-plt
	@./rebar dialyze

crosslang:
	@echo "do ERL_LIBS=../ before you make crosslang or fail"
	cd test && make crosslang
