#!/bin/bash

# starting dremio
/dremio/bin/dremio start &

# check if process running
while true; do
    PID=`ps aux | grep dremio | grep -v grep | awk '{print $2}'`
    if ps -p $PID > /dev/null; then
        sleep 10
    else
        echo "Dremio stopped"
        break
    fi
done
