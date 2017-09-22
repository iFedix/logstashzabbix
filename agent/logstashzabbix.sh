#!/bin/bash

case $1 in
    status )
        initctl status logstash | grep -q running && echo 1 || echo 0 ;;
    heap_bytes )
        curl -s http://localhost:9600//_node/stats/jvm | python -mjson.tool | grep \"heap_used_in_bytes | awk '{ print $2 }' | sed 's/,//' ;;
    heap_percent )
        curl -s http://localhost:9600//_node/stats/jvm | python -mjson.tool | grep \"heap_used_percent | awk '{ print $2 }' | sed 's/,//' ;;
    heap_max )
        curl -s http://localhost:9600//_node/stats/jvm | python -mjson.tool | grep \"heap_max_in_bytes | awk '{ print $2 }' | sed 's/,//' ;;
    events_in )
        curl -s http://localhost:9600//_node/stats/pipeline | python -mjson.tool | head -10 | grep \"in | awk '{ print $2 }' | sed 's/,//' ;;
    events_filtered )
        curl -s http://localhost:9600//_node/stats/pipeline | python -mjson.tool | head -10 | grep \"filtered | awk '{ print $2 }' | sed 's/,//' ;;
    events_out )
        curl -s http://localhost:9600//_node/stats/pipeline | python -mjson.tool | head -11 | grep \"out | awk '{ print $2 }' | sed 's/,//' ;;
    failures )
        curl -s http://localhost:9600//_node/stats/pipeline | python -mjson.tool | grep \"failures | awk '{ print $2 }' | sed 's/,//' ;;
esac
