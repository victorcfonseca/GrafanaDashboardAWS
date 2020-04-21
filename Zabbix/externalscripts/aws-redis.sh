#!/bin/bash

redis=`aws elasticache describe-cache-clusters --region <YOUR_REGION> --query 'CacheClusters[*].[ReplicationGroupId]' --output json | grep -v null | grep -v "\[" | grep -v "\]" | wc -l `

result=$redis

calc=$(($redis/2))

echo $calc
