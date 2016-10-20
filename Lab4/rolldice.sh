#!/bin/bash
# this script prompts the user for a count of dice and then rolls them

### Variables
count=0 # number of dice to roll
sides=0 # number of sides per die, must be between 4 and 20 inclusive

### Command line processing
while [ $# -gt 0 ]; do
  case "$1" in
  
    -h )
      echo "Usage: $0 [-h] [-c numberofdice] [-s 4-20]"
      exit 0
      ;;
    -c )
      if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
        count=$2
        shift
      else
        echo "You gave me '$2' as the number of dice to roll, bad plan muchacho" >&2
        exit 1
      fi
      ;;
    -s )
      if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
        if [ $2 -lt 4 -o $2 -gt 20 ]; then
          echo "Number of sides must be between 4 and 20, inclusive, fool" >&2
          exit 1
        else
          sides=$2
          shift
        fi
      else
        echo "You gave me '$2' as the number of sides per die, no way that's happening" >&2
        exit 1
      fi
      ;;
    * )
      echo "I don't understand '$1'" >&2
      echo "Usage: $0 [-h] [-c numberofdice] [-s 4-20]"
      exit 1
      ;;
  esac
  shift
done

### User input validation
# get a valid roll count from the user
until [[ $count =~ ^[1-9][0-9]*$ ]]; do
  read -p "How many dice shall I roll? " count
done
# get a valid side count from the user
until [[ $sides =~ ^[1-9][0-9]*$ ]]; do
  read -p "How many sides should each die have[4-20]? " sides
  if [ "$sides" -lt 4 -o "$sides" -gt 20 ]; then
    echo "$sides must be from 4 to 20 inclusive" >&2
    sides=0
  fi
done

### Main
# do the dice roll as many times as the user asked for
for (( rolls=0 ; rolls < count ; rolls++ )); do
# roll the dice
  die1=$(($RANDOM % $sides +1))
# show the roll results
  echo "Rolled $die1"
done
