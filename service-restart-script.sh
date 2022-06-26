#!/bin/bash

ls /var/run/apache2/apache2.pid

if [ $? -eq 0 ]
then
echo "APache2 is running"
else
echo "Apach2 is not running"
echo "starting the process"
service apache2 start
if [ $? -eq 0 ]
then
echo "Process started successfuly"
fi
fi

