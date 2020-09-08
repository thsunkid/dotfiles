#!/bin/bash
cd project/

# Adapt from: https://stackoverflow.com/questions/49566160/bash-use-a-select-menu-to-navigate-directories

prompt="Please select the project you're working on:"
options=( $(ls -1) )

PS3="$prompt "
select opt in "${options[@]}" "Quit" ; do
    if (( REPLY == 1 + ${#options[@]} )) ; then
        exit

    elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
        sh $opt
        break

    else
        echo "Invalid option. Try another one."
    fi
done
