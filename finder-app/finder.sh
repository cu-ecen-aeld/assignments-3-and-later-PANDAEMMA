#!/bin/sh
# Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr

# Exits with return value 1 error and print statements if any of the parameters above were not specified

# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

# Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).

set -e
set -u

FILESDIR=""
SEARCHSTR=""

if [ $# -lt 2 ]
then
    echo "Error! Parameters less than 2, need both filesdir and searchstr."
    exit 1
else
    FILESDIR=$1
    SEARCHSTR=$2
fi

if [ ! -d $1 ]
then
    echo "Error! ${FILESDIR} does not represent a directory on the filesystem"
    exit 1
fi

FILENUM=`grep -ril ${SEARCHSTR} ${FILESDIR} | wc -l`
MATCHNUM=`grep -ri ${SEARCHSTR} ${FILESDIR} | wc -l`

echo "The number of files are ${FILENUM} and the number of matching lines are ${MATCHNUM}"
