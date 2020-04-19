#!/bin/bash

###############################################################################
#################################  Maxmilhas  #################################
# Script created by Cloud and Monitoring Team - 2020
# Usage example:
###############################################################################
###############################################################################

declare -i count='0'
lista=$(aws lambda list-functions --query 'Functions[].FunctionArn' | grep -v "\[" | grep -v "\]" | wc -l)
for OUTPUT in $(aws lambda list-functions --query 'Functions[].FunctionArn' | grep -v "\[" | grep -v "\]" | sed -e 's/\"//g' | sed -e 's/\,//g')
do
list_tag=""    
list_tag=$(aws lambda list-tags --resource $OUTPUT  2> /dev/null)
if [[ $list_tag =~ "Tribo" ]];
then
    #echo -e '\033[00;32mTem Tag Tribo: '$OUTPUT'\033[00;37m' 
  
#else
    #echo -e '\033[00;31mNão Tem Tag Tribo: '$OUTPUT'\033[00;37m'  
count=$count+1    
       
fi
#echo "=============================================================================================================================================="
done
total=$(($lista - $count))
echo $total
