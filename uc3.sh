#!/bin/bash -x

echo "******* TIC TAC TOE *******"

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
