#!/bin/bash

if [ "$#" -ne 1 ]
then
        echo "***ERROR: Need a single command line argument."
        exit 1
else
        if grep -q "^$1:" /etc/passwd
        then
                echo "found user '$1' - In Real Life: $(grep $1 /etc/passwd | cut -d : -f5)"
                exit 0
        else
                echo "Could not find '$1'"
                exit 2
        fi
fi
