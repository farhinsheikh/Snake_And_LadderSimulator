#!/bin/bash -x
echo "Welcome to Snake And Ladder Simulator Problem"

START_POSITION=0
WIN_POSITION=100
LADDER=1
SNAKE=2

positionOfPlayer1=0
positionOfPlayer2=0
dieNumber=0

function getDieRoll()
{

   currentPosition=$1
   die=$(( (( $RANDOM%6 ))+1 ))
   checkOptions=$(( $RANDOM%3 ))

   case $checkOptions in
      $NOPLAY)
         currentPosition=$currentPosition ;;

      $LADDER)
         currentPosition=$(( $currentPosition+$die )) ;;

      $SNAKE)
         currentPosition=$(( $currentPosition-$die )) ;;

   esac

   if [[ $currentPosition -lt START_POSITION ]]
   then
   currentPosition=0
   elif [[ $currentPosition -gt WIN_POSITION ]]
   then
   currentPosition=$(( $currentPosition-$die ))
   fi

   echo $currentPosition
}
getDieRoll

function twoPlayers()
{
	while [[ $positionOfPlayer1 -lt WIN_POSITION ]] && [[ $positionOfPlayer2 -lt WIN_POSITION ]]
   do
      positionOfPlayer1=$(getDieRoll $positionOfPlayer1)
      echo "Position of player 1 = $positionOfPlayer1"
      positionOfPlayer2=$(getDieRoll $positionOfPlayer2)
      echo "Position of player 2 = $positionOfPlayer2"
      dieNumber=$(( $dieNumber+1 ))
   done
}

function getWinPosition()
{
	while [[ $positionOfPlayer1 -lt WIN_POSITION ]] && [[ $positionOfPlayer2 -lt WIN_POSITION ]]
   do
      twoPlayers

      if [[ $positionOfPlayer1 -eq WIN_POSITION ]]
      then
         echo "Player 1 Won "
      break
      elif [[ $positionOfPlayer2 -eq WIN_POSITION ]]
      then
         echo "Player 2 Won "
      break
      fi
   done
}
getWinPosition
echo "Total die roll is "$dieNumber

