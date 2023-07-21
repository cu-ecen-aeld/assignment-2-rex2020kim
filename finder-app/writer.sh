#!/bin/sh

WRITEFILE=
WRITESTR=

if [ $# -lt 2 ]
then
    if [ $# -lt 1 ]
    then
        echo "failed: missing parameter 1 (a file name with a path)"
    fi
    echo "failed: missing parameter 2 (a text string to be written in the given file)"
    exit 1
else
    WRITEFILE=$1
    WRITESTR=$2
fi

rm -rf "${WRITEFILE}"
DIR=$(dirname ${WRITEFILE})
mkdir -p "${DIR}"
echo "${WRITESTR}" > "${WRITEFILE}"

echo "${WRITEFILE} is created"

