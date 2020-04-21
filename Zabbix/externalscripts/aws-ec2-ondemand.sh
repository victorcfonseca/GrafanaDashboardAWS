#!/bin/bash

spot=`aws ec2 describe-instances --region <YOUR_REGION> --query 'Reservations[*].Instances[*].InstanceLifecycle' --filters Name=instance-state-name,Values=running | grep -v "\[" | grep -v "\]" | wc -l`
instancias=`aws ec2 describe-instances --region us-east-1 --query 'Reservations[*].Instances[*].InstanceId' --filters Name=instance-state-name,Values=running | grep i- | wc -l`

ondemand=$(($instancias - $spot))

echo $ondemand
