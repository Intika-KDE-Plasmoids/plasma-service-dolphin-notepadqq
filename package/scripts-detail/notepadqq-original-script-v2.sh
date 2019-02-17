if [[ -d ""$*"" ]]; then
    notepadqq "$*"/*; 
elif [[ -f ""$*"" ]]; then 
    notepadqq "$*"; 
else 
    if [ $# -ge 1 ]; then
        j="0"; containspace="false"; 
        while [ $j -lt $# ]; do 
            j=$[$j+1]; 
            eval paramtest="${"$j"}"; 
            if [[ $paramtest = *" "* ]]; then 
                containspace="true"; 
            fi; 
        done; 
        if [ "$containspace" == "true" ]; then 
            while [ $# -gt 0 ]; do 
                notepadqq "$1"; shift; 
            done; 
        else 
            command="notepadqq"; 
            while [ $# -gt 0 ]; do 
                command="$command $1"; 
                shift; 
            done; 
            $command; 
        fi; 
        elif [ $# == 0 ]; then 
        notepadqq; 
    fi; 
fi;