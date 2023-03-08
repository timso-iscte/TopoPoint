#!/bin/bash

File="dados.txt"
FinalFile="altitude.txt"

[ -e $FinalFile ] && rm -v $FinalFile

while IFS=" " read -r step line
do
	echo "$step  $(curl -s $line | grep "elevation" | sed 's/[^0-9.]//g' )" | tee -a $FinalFile
  sleep 1
done < $File
