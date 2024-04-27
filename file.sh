#!/bin/bash
datevalue=`date +%d |cut -c1,2`
cd /tmp
filevalue=`ls -l a.txt|tr -s ' '|cut -d ' ' -f7`
if [ $filevalue = $datevalue ]
then 
echo "file is available"
echo "Thank you linux OSssss"
echo "my name is prasanta"
echo "prasanta"
else
echo "file is not available"
fi 
