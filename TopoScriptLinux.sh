#!/bin/bash

File="data.txt"
ExportFile="elevation.txt"

[ -e $ExportFile ] && rm -v $ExportFile

while IFS=" " read -r step line
do
	echo "$step  $(curl -s $line | grep "elevation" | sed 's/[^0-9.]//g' )" | tee -a $ExportFile
  sleep 1
done < $File
