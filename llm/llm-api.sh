#!/bin/bash

# Load environment variables
set -a
source .env
set + a

# Get prompt from command line
prompt=$1

response=$(curl -s -X POST https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
        "model": "'"$LLM_MODEL"'",
        "temperature": 0.7,
        "messages": [{"role": "user", "content": "'"$prompt"'"}]
}
')

echo "$response"

# echo "$response" | jq -r '.choice[0].text'