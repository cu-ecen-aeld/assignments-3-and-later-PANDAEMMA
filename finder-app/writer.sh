#!/bin/sh
# Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; the second argument is a text string which will be written within this file, referred to below as writestr

# Exits with value 1 error and print statements if any of the arguments above were not specified

# Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.

set -e
set -u

WRITEFILE=""
WRITESTR=""

if [ $# -lt 2 ]
then
    echo "Error: not enough arguments. Need full path to file and text string to write"
    exit 1
else
    WRITEFILE=$1
    WRITESTR=$2
fi

mkdir -p $(dirname ${WRITEFILE})
if [ $? -ne 0 ]
then
    echo "Error: failed to mkdir"
    exit 1
fi

touch ${WRITEFILE}
if [ $? -ne 0 ]
then
    echo "Error: failed to touch ${WRITEFILE}"
    exit 1
fi

echo "${WRITESTR}" > ${WRITEFILE}
if [ $? -ne 0 ]
then
    echo "Error: failed to overwrite ${WRITESTR} to ${WRITEFILE}"
    exit 1
fi
