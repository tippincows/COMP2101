#!/bin/bash

# display how many regular files there are in the Pictures directory
# and how much disk space they use. It should also show the sizes
# and names of the 3 largest files

### Variables
directory=~/Pictures
numberOfFilesToShow=3

### Functions
function usage {
    echo "Usage: $0 [-h|--help] [-c|--count numberOfFilesToDisplay] [directoryToWorkOn]"
    echo "Count defaults to 3, Directory defaults to ~/Pictures"
}

function error-message {
    echo "$@" >&2
}

### Command Line Processing
gotadirectory=no
while [ $# -gt 0 ]; do
    case "$1" in
    -h | --help ) # show usage diagram
        usage
        exit 0
        ;;
    -c | --count ) # specify how many big files to display
        if [[ $2 =~ ^[1-9][0-9]*$ ]]; then
            numberOfFilesToShow=$2
            shift
        else
            usage
            error-message "Count requires a nummber"
            exit 1
        fi
        ;;
    * ) # grab the directory name to work on
    # if we haven't got a directory from the command line yet, this must be it
        if [ $gotadirectory = "no" ]; then
            directory=$1
            gotadirectory="yes"
    # otherwise this is some kind of command line garbage
        else
            usage
            error-message "I didn't understand '$1' as a directory, I already a directory $directory"
            exit 1
        fi
        ;;
    esac
    shift
done

### Main

echo -n "In the ~/Pictures directory, the number of files is "
find $directory -type f |wc -l

echo -n "Those files use "
du -sh $directory |awk '{print $1}'

echo "The $numberOfFilesToShow largest files are:"
echo "========================"
du -h $directory/* |sort -h |tail -$numberOfFilesToShow
