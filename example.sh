#!/bin/bash
cd /tmp
if [ -f a.txt ]
then 
        echo "file is available"
        touch ashwini.txt
else
        echo "file is unavailable"
       
fi
