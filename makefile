#!/usr/bin/make -f -r

# This MakeFile provides development shortcut to frequent tasks.

CUT=cut
DATE=date
ECHO=echo
GIT=git
GREP=grep
SED=sed
SORT=sort
UNIQ=uniq

THENAME=$(file < NAME);
THEVERSION=$(file < VERSION);

.PHONY: all
all: BUILDME	## Alias for BUILDME

.PHONY: clean
clean:	## Clean the project folder
	${GIT} clean -f -x -d;

.PHONY: BUILDME
BUILDME:	## Build the project
	./BUILDME

.PHONY: AUTHORS
AUTHORS:	## Update the authors list
	${ECHO} "Authors\n=======\nWe'd like to thank the following people for their contributions.\n\n" > ${srcdir}/AUTHORS.md
	${GIT} log --raw | ${GREP} "^Author: " | ${GREP} -v ".noreply.github" | ${SORT} | ${UNIQ} | ${CUT} -d ' ' -f2- | ${SED} 's/^/- /' >> ${srcdir}/AUTHORS.md
	${GIT} add AUTHORS.md

HEARTBEAT:	## Update the HEARTBEAT
	${DATE} --utc +%Y-%m > ./HEARTBEAT
	${GIT} add HEARTBEAT

.PHONY: gitcommit
gitcommit: AUTHORS HEARTBEAT	## Create a git commit
	- ${GIT} commit

.PHONY: help
help:	## Show the list of available targets
	@ ${GREP} -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}';

.DEFAULT_GOAL := help
