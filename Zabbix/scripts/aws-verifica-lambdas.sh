#!/bin/bash

###############################################################################
#################################  Maxmilhas  #################################
# Script created by Cloud and Monitoring Team - 2020
# Usage example:
###############################################################################
###############################################################################

declare -i count=0

HOJE=$(date '+%Y-%m-%dT%H:%M:%SZ')

qtd=$2
declare -i qtdade_dias=$qtd
aws_profile=$1

inicio=$(date -d "-$qtdade_dias days"  '+%Y-%m-%d'T00:00:00Z)

periodo=$((60*24*$qtdade_dias))

for OUTPUT in $(aws lambda list-functions --region us-east-1 --profile $aws_profile --query 'Functions[].FunctionName' | grep -v "\[" | grep -v "\]" | sed -e 's/\"//g' | sed -e 's/\,//g')
do
lambda_execution=""    
lambda_execution=$(aws cloudwatch get-metric-statistics --region us-east-1 --profile $aws_profile --metric-name Invocations --start-time $inicio --end-time $HOJE --period $periodo --namespace AWS/Lambda --statistics Sum --dimensions Name=FunctionName,Value=$OUTPUT | jq '.Datapoints[].Sum' 2> /dev/null)

if [[ $lambda_execution == "" ]]
then

count=$count+1

fi
 
done

echo $count 
