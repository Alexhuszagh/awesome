#!/bin/bash

# CONSTANTS
cmd="$1"

# FUNCTIONS

function quitprocess ()
{
    if pgrep $cmd > /dev/null
    then
         kill $(pgrep $cmd)
    else
        :
    fi
}

# CALL FUNCTIONS

quitprocess
