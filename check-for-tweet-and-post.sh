#!/bin/bash
 
currentDate=$(date +"%Y-%m-%d") # current date eg. 2020-05-11
currentTime=$(date +"%H-%M") #current time eg. 20-57
currentHour=$(date +"%H") #current time eg. 20-57
echo "started at $currentTime $currentDate"

cd scheduled

echo "check for scheduled tweets between $currentHour:00-$currentHour:59..."

if [[ -d "$currentDate" ]]
then
    find ./$currentDate -type f -name "$currentHour-*.tweet"
    echo "found $(find ./$currentDate -type f -name "$currentHour-*.tweet" -printf '.' | wc -c) tweet(s) to post now."

else 
    echo "No scheduled tweet(s) found."

fi



echo "Press any key to continue"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "waiting for the keypress"
fi
done
