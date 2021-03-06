#!/usr/bin/env bash

# notify after build

set -e

webHookURL=$(cat /var/jenkins_home/confbot-webhook-url)
id=$(cat /etc/project-id)

json=$(cat <<eof
{
  "type": "jenkins",
  "project_id": "$id",
  "options": {
    "number": "$BUILD_ID",
    "name": "$JOB_NAME"
  }
}
eof
)

curl -X "POST" $webHookURL \
  -H "Content-Type: application/json" \
  -d "$json"