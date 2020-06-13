#!/bin/bash -x

function reSet(){

	board=(0 1 2 3 4 5 6 7 8 9)
}

function displayBoard() {

        echo "***TicTacToe Board***"
        echo "|  ${board[1]}  ||  ${board[2]}  ||  ${board[3]}  |"
        echo "|  ${board[4]}  ||  ${board[5]}  ||  ${board[6]}  |"
        echo "|  ${board[7]}  ||  ${board[8]}  ||  ${board[9]}  |"
        echo "**********************"

}
function computerPlaying() {
	echo "========================="
        echo "Computer turn: "
	exitFlag=0
	while [[ $exitFlag -ne 1 ]]
	do
		position=$((RANDOM%9 + 1))

                if [[ ${board[$position]} == $position ]]
                then
			exitFlag=1
                        board[$position]=$signC
                        checkOver $signC

                        if [[ $win -eq 1 ]]
                        then
                                displayBoard
                                echo "Winner is computer's"
                                exit
                        fi
                fi


	done
	displayBoard
}
function playerPlaying() {
	echo "==========================="

        echo "Player turn: "

	displayBoard
        read -p "Select your Cell 1 to 9 : " position


        board[$position]=$signP
	checkOver $signP
}

signP='O'
signC='X'



function symbol(){

checkSym=$((RANDOM%2))
if [[ $checkSym == 1 ]]
then
        echo "what do you want, X or O ?"
        read signP
        if [[ $signP == X ]]
        then
            signC='O'

        fi

fi
}


function checkOver(){


        for((i=1;i<=9;i=$(($i+3))))
        do
                if [[ ${board[$i]} == ${board[$i+1]} && ${board[$i+1]} == ${board[$i+2]} && ${board[$i+2]} == $1 ]]
                then
                        win=1
                fi
        done
        for((i=1;i<=3;i++))
        do
                if [[ ${board[$i]} == ${board[$i+3]} && ${board[$i+3]} == ${board[$i+6]} && ${board[$i]} == $1 ]]
                then
                        win=1
                fi
        done
        if [[ ${board[1]}  == ${board[5]} && ${board[5]} == ${board[9]} && ${board[5]} == $1 ]]
        then
                win=1
        elif [[ ${board[3]}  == ${board[5]} && ${board[5]} == ${board[7]} && ${board[5]} == $1 ]]
        then
                win=1
        fi


}
function appChecking() {
        if [[ $win -eq 1 ]]
        then
		displayBoard
                echo "Winner is player"
                exit
        elif [[ $count -ge 9 ]]
        then
		echo "=================="
		displayBoard
                echo "tie"
        fi
}




function toss(){
    echo "Coin is tossed...."
    toss=$((RANDOM%2))
    echo "toss is $toss"
    if [[ $toss == 1 ]]
    then
        echo "you won Toss"
        user=1
    else
        echo "comp won the toss"
        user=0
    fi

}

reSet
symbol
toss
#displayBoard

while [[ $count -ne 9 ]]
do
	if [[ $user == 1 ]]
	then
		playerPlaying
		appChecking
        	user=0
    	else
		computerPlaying

        	user=1
    	fi


done






