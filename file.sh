#!/bin/bash
datevalue=`date +%d |cut -c2`
cd /tmp
filevalue=`ls -l a.txt|tr -s ' '|cut -d ' ' -f7`
if [ $filevalue = $datevalue ]
then 
echo "file is available"
else
echo "file is not available"
fi 
