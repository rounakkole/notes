##!/bin/bash -x

for file in `ls *txt`;
   do
   folder=`echo $file | awk -F. '{print $1}'`;
   if [ -d $folder ]
      then
	# echo "Inside if condition"
      rm -r $folder;
   fi
   mkdir $folder;
   cp $file $folder;
   echo $file copied into $folder;
done

# my firsh bash script