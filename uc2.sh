#!/bin/bash -x

echo "******* TIC TAC TOE *******"

read -p "Do you want to START the game? (y/n)" ans

if [[ $ans == y ]]
then
        y=$((RANDOM%2))
        if [[ $y == 0 ]]
        then
                echo "YOU WON TOSS. IT'S YOUR TURN"

        else
                echo "COMP WON TOSS."
        fi
else
        echo "Exit"
fi
