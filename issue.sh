#!/bin/bash

# Simulate the JSON from GraphQL
issue=$(cat issues.json)

# Extract the first valid issue ID
issue_id=$(echo "$issue" | jq -r '.[0].id' | tr -d '\r\n')
# issue_id=$(echo "$issue" | jq -r '.id' | tr -d '\n')


# Validate and output
if [[ "$issue_id" =~ ^I_ ]]; then
  echo "✅ Valid issue_id: $issue_id"
else
  echo "❌ Invalid issue_id: $issue_id"
  exit 1
fi
