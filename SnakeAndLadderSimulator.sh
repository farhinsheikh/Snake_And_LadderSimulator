#!/bin/bash -x
echo "Welcome to Snake And Ladder Simulator Problem"

player=1
position=0

function getDieRoll(){
	die=$(( RANDOM % 6 + 1 ))
}
getDieRoll
echo "your number is = $die"
