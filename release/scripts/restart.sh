#!/bin/bash
usage="$(basename $0) [-hp:] -- script to restart application
where:
    -h  display this help message
    -p  port number on which to start the application
"
portNumber=APP_PORT
while getopts 'hp:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    p) portNumber=$OPTARG
       ;;
    ?) printf "illegal option: '%s'\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done

./stop.sh
echo restarting application at port $portNumber
./start.sh -p $portNumber 