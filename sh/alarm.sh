#!/bin/bash

# FUNCTIONS

function killprocess ()
{
    if ps aux | grep "[a]larm-clock-applet" > /dev/null
    then
         export alarmID=$(pgrep alarm)
         kill -9 $alarmID
    else
        :
    fi
}

function launch()
{
    alarm-clock-applet --hidden
}


# CALL FUNCTIONS

killprocess
launch
