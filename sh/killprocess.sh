#!/bin/bash

# CONSTANTS
cmd="$1"

# FUNCTIONS

function killprocess ()
{
    if pgrep $cmd > /dev/null
    then
         kill -9 $(pgrep $cmd)
    else
        :
    fi
}

# CALL FUNCTIONS

killprocess
