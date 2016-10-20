#!/bin/bash
#Obtain a random number from 1 to 10 and save it. Asks the user for a number from 1 to 10. If the user has correctly guessed your number, tell them, otherwise keep asking until they get it right

num1=$((RANDOM%10 +1)) 

read -p "Please enter a number" num2

if [ num2 
