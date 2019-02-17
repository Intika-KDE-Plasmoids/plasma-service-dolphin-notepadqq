#!/bin/bash

# Rule to convert to a single line : 
# 'do' 'then' does not need ';'
# all the rest need ';' at the end of line 
# warning script not the same !!!!!!!!

if [[ -d ""$*"" ]]; then
    notepadqq "$*"/*
elif [[ -f ""$*"" ]]; then
    notepadqq "$*"
else
    if [ $# -ge 1 ]; then
        # --------------------------------
        j="0"
        containspace="false"
        while [ $j -lt $# ]
        do
            j=$[$j+1]
            eval paramtest="\$${j}"      
            #if echo $paramtest | grep \ >/dev/null
            if [[ $paramtest = *" "* ]]; then
                containspace="true"
            fi
        done
        # --------------------------------
        if [ "$containspace" == "true" ]; then
            # --------------------------------
            i="1"
            while [ $i -le $# ]
            do
                eval param="${"$i"}"
                #eval param="\$${i}" 
                notepadqq "$param"
                i=$[$i+1]
                #finalpath=${param// /'\ '}
            done
        else
            # --------------------------------
            command="notepadqq"
            i="1"
            while [ $i -le $# ]
            do
                eval param="\$${i}" 
                command="$command $param" 
                i=$[$i+1]
            done
            # --------------------------------
            echo $command
            $command
        fi
        # --------------------------------        
    elif [ $# == 0 ]; then
        notepadqq
    fi
fi
