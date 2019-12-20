#!/bin/sh
SERVICE_NAME=Edge
PATH_TO_BINARY=/usr/local/bin/edge
PID_PATH_NAME=/tmp/edge-pid
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then
            edge -platform-ip='platform.iotright.com' -parent-system='a8ec94c80ba2fba4d4e5c2d1f0f701' -edge-ip='localhost' -edge-id='Unimar-Server' -edge-cookie='LY4v98kw08qb3Ms370on0toPE9yDwy'
            echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is already running ..."
        fi
    ;;
    stop)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stoping ..."
            kill $PID;
            echo "$SERVICE_NAME stopped ..."
            rm $PID_PATH_NAME
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
    restart)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stopping ...";
            kill $PID;
            echo "$SERVICE_NAME stopped ...";
            rm $PID_PATH_NAME
            echo "$SERVICE_NAME starting ..."
            edge -platform-ip='platform.iotright.com' -parent-system='a8ec94c80ba2fba4d4e5c2d1f0f701' -edge-ip='localhost' -edge-id='Unimar-Server' -edge-cookie='LY4v98kw08qb3Ms370on0toPE9yDwy'
            echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac