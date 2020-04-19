#!/bin/bash

###############################################################################
#################################  Maxmilhas  #################################
# Script created by Cloud and Monitoring Team - 2020
# Usage example: 
###############################################################################
###############################################################################

declare -i count='0'
#declare -i count_total='0'
lista=$(aws elb describe-load-balancers --query 'LoadBalancerDescriptions[].LoadBalancerName' | grep -v "\[" | grep -v "\]" | sed -e 's/\"//g' | sed -e 's/\,//g' | wc -l)
for OUTPUT in $(aws elb describe-load-balancers --query 'LoadBalancerDescriptions[].LoadBalancerName' | grep -v "\[" | grep -v "\]" | sed -e 's/\"//g' | sed -e 's/\,//g')
do
    
crypt=""
crypt=$(aws elb describe-tags --load-balancer-names  $OUTPUT 2> /dev/null)


if [[ $crypt =~ "Tribo" ]];
    then

#echo -e '\033[05;32mTem Tag Tribo - LoadBalancer Name: '$OUTPUT'\033[00;37m' 
count=$count+1 
    #else
#echo -e '\033[05;31mNão Tem Tag Tribo - LoadBalancer Name: '$OUTPUT'\033[00;37m'    


fi
#echo "========================================================================================"

done    

total=$(($lista - $count))
echo $total


