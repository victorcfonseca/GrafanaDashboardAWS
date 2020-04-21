#!/bin/bash

DIA=$(date +"%d")
MES=$(date +"%m")
ANO=$(date +"%Y")

HOJE=$ANO"-"$MES"-"$DIA"T02:00:00"
#FIM=$ANO"-"$MES"-"$DIA"T11:59:59"


deploy=$(aws deploy list-deployments --region <YOUR_REGION> --include-only-statuses Succeeded --create-time-range start=$HOJE | grep -v "\{" | grep -v "\}" | grep -v "deployments" | wc -l)

echo $deploy
