#!/bin/bash -x

function play(){
    toss
    comp=$?
    win=0
    if [[ $comp==0 ]]
    then 
        echo "what do you want, X or O ?"
        read signP
        if [[ $signP == 'X' ]]
        then 
            signC='O'
        else
            signC='X'
        echo "OK"
        fi
    else 
        signP='X'
        signC='O'
    fi
    n=1
    echo "-----------tic tac toe-------------"
    display
    while [[ $n -le 9 ]]
    do 
        if [[ $comp == 1 ]]
        then 
            echo "Computer is Playing......"
            ch=$((RANDOM%9))
            echo "$ch"
            a[ch]=signC
            unset 'b[$ch]'
            display
            let n+=1
            checkOver
            check=$?
            if [[ $check == 1 ]]
            then
                win=1
                echo "================Computer Won the Game===================="
                break
                fi
        fi
    
        if [[ $n -le 9 ]]
        then 
            echo "Player1 is Playing......"
            echo "Enter Number..............."
            read p1
            a[p1]=signP
            unset 'b[$p1]'
            display
            let n+=1
            checkOver
            check=$?
            if [[ $check == 1 ]]
            then
                win=1
                echo "================player Won the Game======================"
                break
                let comp=1
                let "n+=n+1"
            fi
        fi
    done
}
function display(){
        len=${#a[@]}
        for i in 0 1 2 3 4 5 6 7;
        do
                if [[ $i == 2 || $i == 5 ]]
                then
                        echo "${a[$i]} ||"
                else
                        echo "${a[$i]} ||" #end = ||"
                fi
        done
}

function checkOver(){
        checkDiagonal
        a1=$?
        checkRow
        b1=$?
        checkCol
        c1=$?
        if [[ a1 -eq 1 || b1 -eq 1 || c1 -eq 1 ]]
        then
                return 1
        else
                return 0
                fi
}
function checkDiagonal(){
        if [[ "${a[1]}" && "${a[4]}" && "${a[8]}" == 'X' || "${a[1]}" && "${a[4]}" && "${a[8]}" == 'O' || "${a[2]}" && "${a[4]}" && "${a[6]}" && 'X' || "${a[2]}" && "${a[4]}" && "${a[6]}" == 'O' ]]
        then
                return 1
        else
                return 0
        fi
}

function checkRow(){
        if [[ "${a[0]}" && "${a[1]}" && "${a[2]}" == 'O' || "${a[0]}" && "${a[1]}" && "${a[2]}"  == 'X' || "$a[3]}" && "${a[4]}" && "${a[5]}" == 'X' || "${a[3]}" && "${a[4]}" && "${a[5]}" == 'O' || "${a[6]}" && "${a[7]}" && "${a[8]}" == 'X' || "${a[6]}" && "${a[7]}" && "${a[8]}" == 'O' ]]
        then
                return 1
        else
                return 0
            fi
}
function checkCol(){
        if [[ "${a[0]}" && "${a[3]}" && "${a[6]}" == 'X' || "${a[0]}" && "${a[3]}" && "${a[6]}" == 'O' || "${a[1]}" && "${a[4]}" && "${a[7]}" == 'X' || "${a[1]}" && "${a[4]}" && "${a[7]}" == 'O' || "${a[2]}" && "${a[5]}" && "${a[8]}" == 'X' ||  "${a[2]}" && "${a[5]}" && "${a[8]}" == 'O' ]]
        then
                return 1
        else
                return 0
            fi
}
function toss(){
    echo "Coin is tossed...."
    toss=$((RANDOM%2))
    echo "toss is $toss"
    if [[ $toss == 1 ]]
    then 
        echo "you won Toss"
        return 1
    else 
        echo "comp won the toss"
        return 0
    fi

}
