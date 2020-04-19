#!/bin/bash

###############################################################################
#################################  Maxmilhas  #################################
# Script created by Cloud and Monitoring Team - 2020
# Usage example:
###############################################################################
###############################################################################

declare -i count='0'
lista=$(aws sqs list-queues | grep -v "\[" | grep -v "\]" | grep -v "\{" | grep -v "\}" | sed -e 's/\"//g' | sed -e 's/\,//g' | wc -l)
for OUTPUT in $(aws sqs list-queues | grep -v "\[" | grep -v "\]" | grep -v "\{" | grep -v "\}" | sed -e 's/\"//g' | sed -e 's/\,//g')
do

list_tag=""    
list_tag=$(aws sqs list-queue-tags --queue-url $OUTPUT  2> /dev/null )
if [[ $list_tag =~ "Tribo" ]]
then
    #echo -e '\033[05;32mTem Tag Tribo: '$OUTPUT'\033[00;37m' 
  
#else
    #echo -e '\033[05;31mNão Tem Tag Tribo: '$OUTPUT'\033[00;37m'  
count=$count+1    
       
fi
#echo "==============================================================================="
done
total=$(($lista - $count))
echo $total
