#!/bin/bash -x
echo "Welcome to Snake And Ladder Simulator Problem"

START_POSITION=0
SNAKE=1
LADDER=2
WIN_POSITION=100
dieNumber=0
player=1
positionOfPlayer=$START_POSITION

declare -A positionDictionary

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
			if [ $((positionOfPlayer-die)) -lt $START_POSITION ]
			then
				 positionOfPlayer=$START_POSITION
         else
             positionOfPlayer=$((positionOfPlayer-die))
         fi;;

	esac
}
getDieRoll
echo "POSITION OF PLAYER = $positionOfPlayer"

function winPosition100(){
	while(true)
	do
		getDieRoll
		(( dieNumber++ ))
		positionDictionary["$dieNumber"]=$positionOfPlayer

		if [ $positionOfPlayer -eq $WIN_POSITION ]
		then
		break;
		elif [ $positionOfPlayer -lt $START_POSITION ]
		then
			positionOfPlayer=$START_POSITION
		fi
	done
}
winPosition100
echo "player winning position = $positionOfPlayer"

function getDieKeyVlaue(){
for key in ${!positionDictionary[@]}
do
   echo "Player position when die rolled $key time is : ${positionDictionary[$key]}"
done
}
getDieKeyVlaue

echo "Total Die Rolls = $dieNumber"

function twoPlayers(){
   while [ true ]
      do
         if [ $(( player%2 )) -eq 1 ]
            then
               getDieRoll
               (( player++ ))
               if [ $positionOfPlayer -eq $WIN_POSITION ]
					then
						echo "Player 1 Won"
					else
						echo "Player 2 Won"
               fi
         fi
         break
		done
}
twoPlayers

