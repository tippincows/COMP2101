#!/bin/bash

#Lab 4 queston 4 
#Creates a countdown script that the user allowing the user to specify the time on the command line 
#



##
##Variables
##


declare -i count=$2
declare    reset=$count



##
##Signal processing
##



trap 'count=$reset && countdown &&  echo "Sent a kill signal, too bad were restaring"' 2
trap 'count=$reset && countdown &&  echo "Sent an exit signal Exiting now" && exit 0' 3


##
##Functions
##

function usage 
{
	echo "Usage: $0 [-h | --help] [-t | --time in seconds]"
	
}

function error
{
	echo "$@" >&2
}

function countdown
{



	while [[ $count -gt 0 ]];
	do
		echo "$count"
		sleep 1
		: $((count--))



	done
}


##
## Command Line processing
##

	while [[ $# -gt 0 ]]; 
do
	case "$1" in

		-h | --help )
			usage
			exit 0
	;;

		-t | --time )
			countdown
			

	;;
		* )
			error "'$1' is not a valid input"
			usage
			exit 1
	;;


esac
shift

done

usage
