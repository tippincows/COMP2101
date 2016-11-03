#!/bin/bash

#Lab4 Question 1 Prompts the user for a count of dice and number of sides and then rolls them

##
##Variables
##

declare -i dicenum=0 #Number of dice as integer
declare -i dicesides=0 #Number of sides as integer

##
##Functions
## 
##Functions will be created on a per script basis to avoid confusion when handing in executables

function usage 
{
	echo "Usage: $0 [-h] [-d number of dice] [-s sides between 4-20]" #Shows the user the proper usage syntax
}

function error
{
	echo "$@" >&2 #Simply sends the output to sterror
}

##
##Command line processing
##
##Instructions asked for a -h help function, number function and sides function
##This will be implemented here
##Because dennis was nice enough to show us in class, we can also add functions for -d for dicecount and -s for sides 
	while [ $# -gt 0 ];
do
	case "$1" in 

		-h | --help )
			usage #calls usage function
			exit 0
	;;

		-d | --dicenum)
			if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then #Ensures the input number is 1 and 9 dice
			dicenum=$2
			shift
			else
			error "'$2' Is not a valid input use -h" #Tells the user to refer to help as the input was not valid.
			exit 1
			fi
	;;

		-s | --dicesides) 
			if [[ "$2" =~ ^[1-9][0-9]*$ ]]; 
			then
			if [ $2 -lt 4 -o $2 -gt 20 ]; 
			then
				error "The Number of dice sides must be between 4 and 20"
				usage
				exit 1
			else
				dicesides=$2
				shift
			fi
			else
				error "'$2' Is not a valid input of sides"
				usage 
			exit 1
			fi
	;;
	
		*)
			error "'$1' Is not a valid input"
			usage
			exit 1
	;;
	esac
	shift
done
	
##Handing no user input on the command line
##The Asignment asked to prompt the user for an input if they didnt specify on the command line 
##We Will implement that here.
#Propmts for a number of dice if the command does not contain it
until [ $dicenum -gt 0 ];
do 
	read -p "Please enter a number of dice to roll: " dicenum #Assigns the input to dicenum and the script carries on
done

#propmts the user for a number of sides of not specified on the command line.
until [ $dicesides -gt 3 -a $dicesides -lt 21 ]; #Doesn't stop prompting until a valid input is recieved
do
	read -p "Please enter a number of sides each dice should have (Between 4 - 20 sides): " dicesides
	
done


##Main part of the script

roll=0

	for (( rolls=0 ; rolls < dicenum ; rolls++ ));
do
	#This function rolls the dice
	die=$(($RANDOM % $dicesides +1))
	roll=$((roll + die))

	#Outputs the results of the dice roll
	echo "The system rolled a $die" #Outputs the number the dice rolled
done

	echo "Your total is $roll" #Outptuts the total of teh dice rolled


#End Of Script
