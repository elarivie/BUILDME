#!/usr/bin/make -f -r

# This MakeFile provides development shortcut to frequent tasks.

SHELL=/bin/sh

CUT=cut
GIT=git
GREP=grep
DATE=date
ECHO=echo
MKDIR=mkdir
TOUCH=touch
RM=rm
RM_RF=${RM} -rf
SED=sed
SORT=sort
TAR=tar
UNIQ=uniq

srcdir=.

THENAME :=`cat "${srcdir}/NAME"`
THEVERSION :=`cat "${srcdir}/VERSION"`

all: BUILDME

BUILDME:
	${srcdir}/BUILDME

AUTHORS:
	cd ${srcdir}
	${ECHO} "Authors\n=======\nWe'd like to thank the following people for their contributions.\n\n" > ${srcdir}/AUTHORS.md
	${GIT} log --raw | ${GREP} "^Author: " | ${GREP} -v ".noreply.github" | ${SORT} | ${UNIQ} | ${CUT} -d ' ' -f2- | ${SED} 's/^/- /' >> ${srcdir}/AUTHORS.md
	${GIT} add AUTHORS.md

HEARTBEAT:
	cd ${srcdir}
	${DATE} --utc +%Y-%m > ${srcdir}/HEARTBEAT
	${GIT} add HEARTBEAT

gitcommit: AUTHORS HEARTBEAT
	cd ${srcdir}
	- ${GIT} commit

.PHONY: all BUILDME HEARTBEAT AUTHORS gitcommit
