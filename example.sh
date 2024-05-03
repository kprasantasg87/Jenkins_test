#!/bin/bash
cd /tmp
if [ -f a.txt ]
then 
        echo "file is available"
else
        echo "file is unavailable"
fi
