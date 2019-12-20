#!/bin/sh
SERVICE_NAME=cb_console
PATH_TO_BINARY=/opt/iotright/cb_console
PID_PATH_NAME=/tmp/cb_console-pid
case $1 in
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then
            nohup cb_console -platformURL=http://localhost -messageURL=localhost -platformPort=9000 -isEdge /tmp 2>> /var/log/cbconsole-error.log >> /var/log/cbconsole.log &
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
            nohup cb_console -platformURL=http://localhost -messageURL=localhost -platformPort=9000 -isEdge /tmp 2>> /var/log/cbconsole-error.log >> /var/log/cbconsole.log &
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac