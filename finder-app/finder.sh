#!/bin/sh

FILESDIR=
SEARCHSTR=
NUMFILES=
NUMLINES=

if [ $# -lt 2 ]
then
    if [ $# -lt 1 ]
    then
        echo "failed: missing parameter 1 for a path to a directory"
    fi
    echo "failed: missing parameter 2 for a text string to be found"
    exit 1
else
    FILESDIR=$1
    SEARCHSTR=$2
fi

if [ -d "${FILESDIR}" ]
then
    echo "Searching a text string \"${SEARCHSTR}\" in a directory \"$(readlink -e ${FILESDIR})\"."
else
    echo "No directory(\"${FILESDIR}\") exist."
    exit 1
fi

NUMLINES="$(grep -r ${SEARCHSTR} ${FILESDIR} | wc -l)"
NUMFILES="$(grep -rl ${SEARCHSTR} ${FILESDIR} | wc -l)"
echo "The number of files are ${NUMFILES} and the number of matching lines are ${NUMLINES}"


