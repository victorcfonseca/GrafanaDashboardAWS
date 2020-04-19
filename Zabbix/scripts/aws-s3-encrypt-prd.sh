#!/bin/bash

###############################################################################
#################################  Maxmilhas  #################################
# Script created by Cloud and Monitoring Team - 2020
# Usage example:
###############################################################################
###############################################################################

declare -i count='0'
#declare -i count_total='0'
lista=$(aws s3 ls | cut -c20-200 | wc -l)
for OUTPUT in $(aws s3 ls | cut -c20-400)
do
    
crypt=""
crypt=$(aws s3api get-bucket-encryption --bucket $OUTPUT 2> /dev/null)


if [[ $crypt =~ "AES256" || $crypt =~ "aws:kms" ]];
    then

#echo -e '\033[05;32mTem Criptografia - Bucket Name: '$OUTPUT'\033[00;37m' 
count=$count+1 
    #else
#echo -e '\033[05;31mNão Tem Criptografia - Bucket Name: '$OUTPUT'\033[00;37m'    


fi
#echo "========================================================================================"

done    

total=$(($lista - $count))
echo $total


