#!/bin/bash
set -eo pipefail
FUNCTION=$(aws cloudformation describe-stack-resource --stack-name blank-go --logical-resource-id function --query 'StackResourceDetail.PhysicalResourceId' --output text --profile localstack)

while true; do
  aws lambda invoke --function-name $FUNCTION --payload fileb://event.json out.json --profile localstack
  cat out.json
  echo ""
  sleep 2
done
