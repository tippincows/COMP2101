#!/bin/bash
 
##Lab 4 Question 3 
## Modifies Picstats to accept a help function, a directory to search, a count of how many of
## the biggest files todisplay, 

## If the user doesnt specify it will defailt to ~/pictures 
## as well as display the 3 largest files in that directory.

##
##Variables
##

directorydefault=~/Pictures #The default directory is the user doesnt specify one
directory=no #By default there will be no specified directory this will change if the user inputs one
declare -i files=3 #The default for the number of files to show defaulted to an integer

##
##Functions
##
##Functions will be made on a per script basis to avoid confusion when handing in executeables

function usage
{
	#Displays The proper usage syntax
	echo "Usage: $0 [-h | --help - Display Help] [-c | --count - Number Of Files To Display] [directory]"
}

function error
{
	##Sends to st err
	echo "$@" >&2
}

##
##Command Line processing
##
##Instructions asked for a -h help, -c count of files, as well as a directory We will implement that here

	while [ $# -gt 0 ];
do
	case "$1" in

		-h | --help ) #Gives the user a help option
			usage ##Calls usage function
			exit 0
	;;

		-c | --count ) #Option to specify a count of files to display
			if [[ $2 =~ ^[1-9][0-9]*$ ]]; 
			then
				files=$2 ##Changes the default from 3 to whatever the user input
			shift
			else
				usage
				error "Please enter a number, although this won't happen as the number is declared as an integer"
				exit 1
			fi
	;;
		* )		 #Directory name processing
			if [ $directory = "no" ]
			then
				directorydefault=$1
				directory="yes"
			else
				usage
				error "'$1' Is not a valid directory please ensure path name is correct"
				exit 1
			fi
	;;

	esac
		shift
done




##
##Main part of the script
##

#Outputs the number of files in the directory in a nice little list
echo -n "Here are the number of files in the $directorydefault directory:"
	find $directorydefault -type f | wc -l

#Outputs the space the files use on the hard disk
echo -n "The Files use "
	du -sh $directorydefault | awk '{print $1}'

#Outputs the files in decending order from largest to smallest
echo "The $files largest files are as follows:"
echo "------------------"
	du -h $directorydefault/* | sort -h | tail -$files



