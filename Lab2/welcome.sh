#!/bin/bash
#This script prints out a welcome message using variables and command substitution

export MYNAME="Lucas Carroll"
MYTITLE="Captain"

planet=`hostname`
weekday=$(date +%A)
echo "Welcome to planet $planet, $MYTITLE $MYNAME!"
echo "Today is $weekday."
