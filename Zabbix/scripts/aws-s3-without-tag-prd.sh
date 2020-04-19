#!/bin/bash

###############################################################################
#################################  Maxmilhas  #################################
# Script created by Cloud and Monitoring Team - 2020
# Usage example:
###############################################################################
###############################################################################

declare -i count='0'
lista=$(aws s3 ls | wc -l)
for OUTPUT in $(aws s3 ls | cut -c20-80)
do

list_tag=""    
list_tag=$(aws s3api get-bucket-tagging --bucket $OUTPUT 2> /dev/null )
if [[ $list_tag =~ "Tribo" ]]
then
    #echo -e '\033[05;31mNão Tem Tag Tribo: '$OUTPUT'\033[00;37m' 
  
#else
    #echo -e '\033[05;32mTem Tag Tribo: '$OUTPUT'\033[00;37m'  
count=$count+1    
       
fi
#echo "==============================================================================="
done
total=$(($lista - $count))
echo $total

