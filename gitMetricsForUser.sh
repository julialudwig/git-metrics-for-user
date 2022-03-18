#!/bin/bash
#
if [[ $# -eq 1 ]]; then
        echo "usage: gitMetricsForUser username repository"
elif [[ $# -eq 2 ]]; then
        ls | grep $2
        if [[ !(-d "$2") ]]; then
                echo "gitMetricsForUser: $2: Not a directory"
        else            
                email="$1"
                repo="$2"
                cd $repo
                lines="$(git log | grep $email)"
                commits=0
                while read line; do
                        for word in $line; do
                                if [ "$word" == "<$email>" ]; then
                                        ((commits+=1))
                                fi      
                        done
                done < <(echo $lines)
                echo
                echo "User $email has made $commits commits"
                echo "Longest message:"
                echo
                entries="$(git log | grep -A 3 $email)"
                longest=""
                i=1
                while read line; do
                        if [ $i -eq 5 ]; then
                                i=0
                        elif [ $i -eq 4 ]; then
                                if [ ${#line} -gt ${#longest} ]; then
                                        longest="$line"
                                fi
                        fi
                        ((i+=1))
                done < <(echo "$entries")
                echo "$longest"
        fi
fi
