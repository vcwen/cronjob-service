echo "external env:${TAG}"
TIMESTAMP=$(date -u +%Y%m%d%H)
SUDO_TOKEN="rRr06a01Bi7sEN0L"
TOKEN=$(echo -n "${SUDO_TOKEN}:${TIMESTAMP}" | sha1sum | awk '{print $1}')
echo "${SUDO_TOKEN}:${TIMESTAMP}"
echo $TOKEN

curl -s --fail-with-body -X POST \
  -H 'Authorization: Bearer ${TOKEN}' \
  -H 'Content-Type: application/json' \
  -d '{}' \
  https://api-dev.etab.wfe.digital/
