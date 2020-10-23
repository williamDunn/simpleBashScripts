#!/bin/bash

filename="$1"

#Checks if number of arguments is 1
if [ "$#" -ne 1 ]
then
    >&2 echo "Command needs the filename as the sole command line argument"
    exit 1
else
#Checks if file exists
    if [ -f "$1" ]
    then
#if file exists then it reads each line and displays the name
        while read -r line
        do
            name="$line"
            echo "User $name ------------------------"
#this reads the last line(plan) of the finger command for each user
            finger $line | tail -n 1
            echo

        done < "$filename"
        exit 0
    else
        >&2 echo "File $1 doesn't exist."
        exit 2
    fi
fi

