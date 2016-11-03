#!/bin/bash

#I totally aced this script

##Lab4 Question 4 
##Modifies showinterfaces.sh to accept a help option as well as an interface name to display
##Also only displays route information if the user gives the -r --route option


##
##Variables
##

declare -a interface		#Declares interface as an array
declare -a ipinfo 		#Declares ipinfo as an array
declare -a gateway
declare    interfaceindex=0 
declare    gatewayindex=0



##
##Population of arrays
##
## 4 interfaces should be enough Yes we could of done the loop Dennis provided us here :(
## 



gateway[0]=`route -n | grep '^0.0.0.0'  | awk '{print $2}' | sed -n "1 p"`
gateway[1]=`route -n | grep '^0.0.0.0'  | awk '{print $2}' | sed -n "2 p"`
gateway[2]=`route -n | grep '^0.0.0.0'  | awk '{print $2}' | sed -n "3 p"`
gateway[3]=`route -n | grep '^0.0.0.0'  | awk '{print $2}' | sed -n "4 p"`


interface[0]=`ifconfig | grep '^[a-zA-Z]' | awk '{print $1;}' | sed s'/.$//' | sed -n "1 p"`
interface[1]=`ifconfig | grep '^[a-zA-Z]' | awk '{print $1;}' | sed s'/.$//' | sed -n "2 p"`
interface[2]=`ifconfig | grep '^[a-zA-Z]' | awk '{print $1;}' | sed s'/.$//' | sed -n "3 p"`
interface[3]=`ifconfig | grep '^[a-zA-Z]' | awk '{print $1;}' | sed s'/.$//' | sed -n "4 p"`

ipinfo[0]=`ifconfig ${interface[0]} | grep 'inet ' | sed -e 's/ *inet addr://' | sed -e 's/ .//' | awk '{print $2}'`
ipinfo[1]=`ifconfig ${interface[1]} | grep 'inet ' | sed -e 's/ *inet addr://' | sed -e 's/ .//' | awk '{print $2}'`
ipinfo[2]=`ifconfig ${interface[2]} | grep 'inet ' | sed -e 's/ *inet addr://' | sed -e 's/ .//' | awk '{print $2}'`
ipinfo[3]=`ifconfig ${interface[3]} | grep 'inet ' | sed -e 's/ *inet addr://' | sed -e 's/ .//' | awk '{print $2}'`

##
##Functions
##
##Functions will be created on a per script basis to avoid confusion when handing in executables
##Yes i understand this is rather redundant

function usage 
{
	#Displays The proper usage syntax
        echo "Usage: $0 [-h | --help - Display Help] [-i [interface] - Displays Ip Address| [-r | --route - [interface] -Displays Default Gateway ]" 
}

function error
{
	#Sends the output to standard error
        echo "$@" >&2
}


##
##Command line processing

##
##Instructions asked for a -h help option as well as an -i interface name to display and -r for route information

	 while [ $# -gt 0 ];
 do
         case "$1" in

		-h | --help )
			usage #calls usage function
			exit 0
	;;

		-i | --interface )
			
			
			
			until [[ "$#" = 1 ]];
	
			do

			if [[ $2 = ${interface[0]} ]];
			then
			 	echo "$2 has the IP Address of: ${ipinfo[0]}"
				shift
				
				
			elif [[ $2 = ${interface[1]} ]];
			then
				echo "$2 has the IP Address of: ${ipinfo[1]}"
				shift
				
			
			elif [[ $2 = ${interface[2]} ]];
			then
				echo "$2 has the IP Address of: ${ipinfo[2]}"
				shift
				
				
			elif [[ $2 = ${interface[3]} ]];
			then
				echo "$2 has the IP Address of: ${ipinfo[3]}"
				shift
				
				
					
			else
				error "Please enter a valid interface"
				usage
				exit 1
			fi
				
			done	
			exit 0
				
	;;
		-r | --route )
			
			until [[ "$#" = 1 ]];
			do

			if [[ $2 = ${interface[0]} ]];
			then
				echo "$2 has the default gateway of: ${gateway[0]}"
				shift
				exit 0
				
			elif [[ $2 = ${interface[1]} ]];
			then
				echo "$2 has the default gateway of: ${gateway[1]}"
				shift
				exit 0
				
			elif [[ $2 = ${interface[2]} ]];
			then
				echo "$2 has the default gateway of: ${gateway[2]}"
				shift
				exit 0
				
			elif [[ $2 = ${interface[3]} ]];
			then
				echo "$2 has the default gateway of: ${gateway[3]}"
				shift
				exit 0
				
			else
				error "Please enter a valid interface"
				usage
				exit 1
			fi
			
			done

	;;

		* )

			error "'$1' is not a valid input"
			usage
			exit 1
	;;

	esac
		shift
done

##
##Main part of the script
##

##
##Displays All information By Default if the user does not specify any command line options
##

if [[ "$*" = "" ]];
then

cat << output

		Interface ${interface[0]} has the IP Address of ${ipinfo[0]}
		Interface ${interface[1]} has the IP Address of ${ipinfo[1]}
		Interface ${interface[2]} has the IP Address of ${ipinfo[2]}
		Interface ${interface[3]} has the IP Address of ${ipinfo[3]}
output



fi

