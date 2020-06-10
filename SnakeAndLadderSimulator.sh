#!/bin/bash -x
echo "Welcome to Snake And Ladder Simulator Problem"

POSITION=0
SNAKE=1
LADDER=2
WIN_POSITION=100


positionOfPlayer=$POSITION

function getDieRoll(){
	die=$(( RANDOM % 6 + 1 ))
	checkOptions=$(( RANDOM % 3 ))
	case $checkOptions in
		$NO_PLAY)
			positionOfPlayer=$((positionOfPlayer+0));;
		$LADDER)
			if [ $(( positionOfPlayer+die )) -gt $WIN_POSITION ]
			then
				positionOfPlayer=$((positionOfPlayer-die))
			else
				 positionOfPlayer=$((positionOfPlayer+die))
			fi;;
		$SNAKE)
			positionOfPlayer=$((positionOfPlayer-die));;
	esac
}
getDieRoll
echo "POSITION OF PLAYER = $positionOfPlayer"

function winPosition100(){
	while(true)
	do
		getDieRoll
		if [ $positionOfPlayer -eq $WIN_POSITION ]
		then
		break;
		elif [ $positionOfPlayer -lt $POSITION ]
		then
			positionOfPlayer=0
		fi
	done
}
winPosition100
echo "player winning position = $positionOfPlayer"
