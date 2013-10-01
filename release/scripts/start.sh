#!/bin/bash

usage="$(basename $0) [-hvp] -- script to run application
where:
    -h  display this help message
    -v  application build version 
    -p  port (required)
"
version="current"
port="APP_PORT"

while getopts 'hv:p:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    v) version=$OPTARG
       ;;
    p) port=$OPTARG
       ;;
    ?) printf "illegal option: '%s'\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done

cd $version && nohup java -Xms500m -Xmx500m APP_PROPERTIES -cp $(echo *.jar | tr ' ' ':') MAIN_APP_CLASS $port STOP_APP_PATTERN > log.out 2> log.err < /dev/null &

echo currently running version:
ls -l | grep current
