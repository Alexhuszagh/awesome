#!/bin/bash

# CONSTANTS

signal="SIGTERM"

## -a flag for ps aux | grep $OPTARG
## -g flag for pgrep $OPTARG
## sigflag = SIGTERM or SIGKILL

while getopts ":a:g:q:" opt; do
  case $opt in
    a)
      auxgrep=$OPTARG
      echo "-a was triggered, Parameter: $OPTARG" >&2
      ;;
    g)
      pgrep=$OPTARG
      echo "-g was triggered, Parameter: $OPTARG" >&2
      ;;
    q)
      signal=$OPTARG
      echo "-q was triggered, Parameter: $OPTARG" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

## Quit if no parameters chosen
if [ -z "$auxgrep" ] && [ -z "$pgrep" ] ; then
    echo "killprocess requires a parameter" >&2
    exit 1
else
    :
fi

## Set sigkill level
if [[ signal = "SIGTERM" ]] ; then
    sigflag = ""
elif [[ signal = "SIGKILL" ]]; then
    sigflag = "-9 "
fi

# FUNCTIONS
function killprocess ()
{
    if [ -z "$pgrep" ] ; then
        if ps aux | grep $auxgrep > /dev/null ; then
            kill $"sigflag" $(ps aux | grep $auxgrep | awk '{print $2}')
        fi
    elif [ -z "$auxgrep" ] ; then
        if pgrep $pgrep > /dev/null ; then
            kill $"sigflag" $(pgrep $pgrep)
        fi
    else
        :
    fi
}

# CALL FUNCTIONS

killprocess
