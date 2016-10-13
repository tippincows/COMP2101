#!/bin/bash

#Create an array of colours, with at least 4 colours in it.
#Create an associative array of animals, where the keys are
#colours, and the values are animals who are that colour. Use
#the colours you put into the first array. Ask the user for a
#number and use it to display a colour from the array, then the
#corresponding animal from the associative array for that colour.

colours=( "red" "green" "blue" "yellow")

declare -A animals
animals=(["red"]="Cardinal" ["green"]="frog" ["blue"]="lobster" ["yellow"]="canary")

