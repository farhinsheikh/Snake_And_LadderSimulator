#!/bin/bash -x
echo "Welcome to Snake And Ladder Simulator Problem"

POSITION=0
SNAKE=1
LADDER=2
NO_PLAY=0
player=1

positionOfPlayer=$POSITION

function getDieRoll(){
	die=$(( RANDOM % 6 + 1 ))
	checkOptions=$(( RANDOM % 3 ))
	case $checkOptions in
		$NO_PLAY)
			positionOfPlayer=$((positionOfPlayer+0));;
		$LADDER)
			positionOfPlayer=$((positionOfPlayer+die));;
		$SNAKE)
			positionOfPlayer=$((positionOfPlayer-die));;
	esac
}
getDieRoll
echo "POSITION OF PLAYER = $positionOfPlayer"

