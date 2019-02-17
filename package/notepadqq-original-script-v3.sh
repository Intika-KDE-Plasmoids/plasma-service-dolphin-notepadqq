if [[ -d ""$*"" ]]; then
    notepadqq "$*"/*; 
elif [[ -f ""$*"" ]]; then 
    notepadqq "$*"; 
else 
    if [ $# -ge 1 ]; then
        command="notepadqq"; 
        while [ $# -gt 0 ]; do 
            if [[ $1 = *" "* ]]; then 
                notepadqq "$1";
            else           
                command="$command $1"; 
            fi;
            shift; 
        done; 
        $command; 
    elif [ $# == 0 ]; then 
        notepadqq; 
    fi; 
fi;