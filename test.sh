echo "external env:${TAG} ${BASE} ${BLOB}"

TIMESTAMP=$(date -u +%Y%m%d%H)
SUDO_TOKEN="rRr06a01Bi7sEN0L"
TOKEN=$(echo -n "${SUDO_TOKEN}:${TIMESTAMP}" | sha1sum | awk '{print $1}')
echo "${SUDO_TOKEN}:${TIMESTAMP}"
echo $TOKEN

curl -s --fail-with-body -X POST \
  -H 'Authorization: Bearer ${TOKEN}' \
  -H 'Content-Type: application/json' \
  -d '{"airtableBaseCode": "${BASE}","container": "${CONTAINER}","blob": "${BLOB}"}' \
  https://api-dev.etab.wfe.digital/airtable/export
