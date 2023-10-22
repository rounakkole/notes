##!/bin/bash -x

read -p "find text: " ip;

SAVEIFS=$IFS;
IFS=$(echo -en "\n\b");

for file in `ls -p | grep -v /`;
   do
	found=`cat $file | grep $ip`
   if [ -n "$found" ]
      then
	   echo $file : $found;
	   echo;
   fi
done

IFS=$SAVEIFS;

read -p "press enter ..." console;
