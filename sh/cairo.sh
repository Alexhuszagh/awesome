#!/bin/bash

# FUNCTIONS

function killprocess ()
{
    if pgrep "cairo-dock" > /dev/null
    then
         echo "Lame" > ~/lame.txt
         export cairo=$(pgrep cairo-dock)
         kill -9 $cairo
    else
        :
    fi
}

function launch()
{
    cairo-dock -c -W &
}

# CALL FUNCTIONS

killprocess
launch

