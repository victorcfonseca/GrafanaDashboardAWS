#!/bin/bash

comando=$(aws ec2 describe-network-interfaces --region <YOUR_REGION> --query 'NetworkInterfaces[*].Status' | grep available | wc -l)

echo $comando
