# /bin/bash

# required env API_BASE_URL,SUDO_TOKEN, ACTION, BASE, CONTAINER, BLOB
if [ -z $SUDO_TOKEN ]; then
  echo "env SUDO_TOKEN is required"
  exit 1
fi

if [ -z $API_BASE_URL ]; then
  echo "env API_BASE_URL is required"
  exit 1
fi

if [ -z $BASE ]; then
  echo "env BASE is required"
  exit 1
fi

if [ -z $CONTAINER ]; then
  echo "env CONTAINER is required"
  exit 1
fi

if [ -z $BLOB ]; then
  echo "env BLOB is required"
  exit 1
fi

if [ -z $ACTION ]; then
  echo "env ACTION is required"
  exit 1
fi

TIMESTAMP=$(date -u +%Y%m%d%H)
TOKEN=$(echo -n "${SUDO_TOKEN}:${TIMESTAMP}" | sha1sum | awk '{print $1}')

if [ "${BLOB}" = "auto-generated" ]; then
  BODY='{"airtableBaseCode": "'${BASE}'","container": "'${CONTAINER}'"}'
else
  BODY='{"airtableBaseCode": "'${BASE}'","container": "'${CONTAINER}'","blob": "'${BLOB}'"}'
fi
echo $BODY

curl -s --fail-with-body -X POST \
  -H "Authorization: Bearer ${TOKEN}" \
  -H 'Content-Type: application/json' \
  -d "$BODY" \
  "${API_BASE_URL}/airtable/$ACTION"
