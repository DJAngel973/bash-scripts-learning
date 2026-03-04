#!/bin/bash

echo "Enter a number from 0 to 10"
read number

if [[ $number -ge 0 && $number -le 10 ]]
then
	echo "The number is: $number"
else
	echo "Invalid number"
fi
