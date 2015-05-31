#!/bin/bash

# FUNCTIONS

function killprocess ()
{
    if pgrep conky > /dev/null
    then
         kill -9 $(pgrep conky)
    else
        :
    fi
}

function launch()
{
    conky &
}


# CALL FUNCTIONS

killprocess
launch
