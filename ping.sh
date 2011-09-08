#!/bin/bash
#Dennis Wisnia
#Next Commerce
hosts="./hosts"
IFS=$'\n'
if [ -f $hosts ]; then
    for i in $(cat $hosts); do
        hostname=$(echo $i | cut -d" " -f1)
        ip=$(echo $i | cut -d" " -f2)
        ping -c 1 $ip > /dev/null
        if [ $? -eq 0 ]
            then
                echo "UP $hostname"
            elif [ $? -eq 1 ]
            then
                echo "UNKNOWN $hostname"
            elif [ $? -eq 2  ]
            then
                echo "DOWN $hostname"
            else
                echo "GOD NNOO!!!!!"
        fi 

    done
else
    echo "JESUS NNOO!!!!!!"
    exit 1
fi


