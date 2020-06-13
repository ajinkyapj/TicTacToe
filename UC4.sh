#!/bin/bash -x

echo "******* TIC TAC TOE *******"

declare -a Arr
Arr=(1 2 3 4 5 6 7 8 9)
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
function board(){
  echo "   ${Arr[0]} | ${Arr[1]} | ${Arr[2]}"
  echo "  -----------"
  echo "   ${Arr[3]} | ${Arr[4]} | ${Arr[5]}"
  echo "  -----------"
  echo "   ${Arr[6]} | ${Arr[7]} | ${Arr[8]}"
}
board
