#!/usr/bin/env bash

usage() {
cat << EOF
Usage: printargs.sh [OPTIONS] [ARGUMENTS]
  Print the number of arguments.

OPTIONS:
  -h      print help message
  -m MSG  custom message
  -v      print each argument

Examples:
  printargs.sh a b c
  printargs.sh -v a b c
  printargs.sh -m 'Arguments count: ' a b c
  printargs.sh -m 'Arguments count: ' -v  a b c
  printargs.sh -h

EOF
}

VERBOSE=0

while getopts “hm:v” OPTION
do
    case $OPTION in
        h)
            usage
            exit 1
            shift;;
        m)
            MESSAGE=$OPTARG;;
        v)
            VERBOSE=1;;
    esac
done

COUNT=0

shift $((OPTIND-1))

for ARG in $@; do
    let COUNT+=1
    if [[ "$VERBOSE" == "1" ]]; then
        echo $ARG
    fi
done

if [[ "$MESSAGE" != "" ]]; then
    echo $MESSAGE
fi

echo $COUNT
