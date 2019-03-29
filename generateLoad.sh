#!/bin/bash

callws(){
timeInit=`date +%s`
shuf -n 200 dev.csv | while IFS=, read -r col1 col2 col3
do
    ts=`date +%s`
    curl -X GET --silent --output /dev/null --header 'Accept: */*' "http://137.120.17.99/Human/xrefs/$col2/$col1"
    te=`date +%s`
    tt=`expr $te - $ts`
    echo "testing: $col1 $col2 took $tt"
done
#< shuf -n 10 dev.csv

timeEnd=`date +%s`
echo `expr $timeEnd - $timeInit`
} 

tst=`date +%s`
for i in {1..20}
do
	callws $i & # Put a function in the background
done

wait
tet=`date +%s`
tt=`expr $tet - $tst`
echo "finished $tt"

