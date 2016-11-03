#!/bin/bash

function usage {
	echo "Usage: $0 [-h | --help] [-t | --time in seconds]"
	echo "Count is default in seconds"
	}

function error-message {
	echo "$@" >&2
	}



declare -i count=$1 
reset=$count
trap 'count=$reset echo "Sent a kill signal, too bad were restaring"' 2
trap 'count=$reset && echo "Sent an exit signal Exiting now" && exit 0' 3
## Command Line processing


while [ $count -gt 0 ]; do
	case "$1" in
	-h | --help )
	usage
	exit 0
	;;

	-t | --time )
	while [ $count -gt 0 ]; do

	echo "The number is $count "

	count=$(($count-1))
sleep 1

	done
	

#while	 [[ $2 -gt 0 ]]; 
#do
	 
#	sleep $2 && echo $2-1  && echo "Very Well I have waited" $2 "Seconds"
#done

if [ $2 = 0 ]; then
	error-message "Somebody once told me the world was gonna roll me, i ain't the sharpest tool in the shed, she was looking kinda dumb with her finger and her thumb in the shape of an L in her forhead. Well the years start commin and the dont stop commin, fed to the rules and i hit the ground runnin, didnt make sense not live for fun, your brain gets smart but your head gets dumb, so much to do so much to see so whats wrong with taking the back streets, youl never know if you dont go, GO! youl never shine if you dont glow. Hey now! your an allstar get your game on go play"
	exit 2;
	shift
fi

	usage
	exit 2;
	
	;;
	esac
	shift	
done


###Main output 

while [ $count -gt 0 ]; do

echo "The number is $count "

count=$(($count-1))

done

