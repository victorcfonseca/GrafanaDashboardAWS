#!/bin/bash

ips=`aws ec2 describe-addresses --region <YOUR_REGION> --query 'Addresses[*].PublicIp' | grep -v "\[" | grep -v "\]" | wc -l`

inst=`aws ec2 describe-addresses --region <YOUR_REGION> --query 'Addresses[*].AssociationId' | grep -v "\[" | grep -v "\]" | wc -l`

soma=$(($ips - $inst))

echo $soma


