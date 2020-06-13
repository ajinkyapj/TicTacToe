#!/bin/bash -x

echo "******* TIC TAC TOE *******"
declare -a pos
pos=(0 1 2 3 4 5 6 7 8 9)
read -p "Do you want to START the game? (y/n)" ans

function symbol(){

checkSym=$((RANDOM%2))
if [[ $checkSym==1 ]]
then
        echo "Select your symbol x or o ?"
        read signP
        if [ $signP==x ]
        then
            signC='o'
        else
            signC='x'
        fi
else
        signP='x'
        signC='o'
fi
echo "User :$signP"
echo "Comp: $signC"
}
symbol
function display(){

        len=${#pos[@]}
        for i in 1 2 3 4 5 6 7 8 9;
        do
                if [[ $i == 3 || $i == 6 ]]
                then
                        echo "${a[i]} |"

                else
                        echo -n "${a[i]} | "

                fi
        done
}
display
