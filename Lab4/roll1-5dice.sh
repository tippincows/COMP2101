#!/bin/bash
# this script prompts the user for a count of dice and then rolls them

# get a valid roll count from the user
while [ 1 ]; do
  read -p "How many dice shall I roll[1-5]? " count
  # ignore empty guesses
    [ -n "$count" ] || continue
    # guess must have the number 1-5 only
    # ***** Debian bash requires no quotes around regex, others require them! *****
      [[ $count =~ ^[1-5]$ ]] && break
      done

      # do the dice roll as many times as the user asked for
      for (( rolls=0 ; rolls < count ; rolls++ )); do
      # roll the dice
        die1=$(($RANDOM %6 +1))
	  die2=$(($RANDOM %6 +1))
	    rolled=$(($die1 + $die2))
	    # show the roll results
	      echo "Rolled $die1,$die2 for $rolled"
	      done
