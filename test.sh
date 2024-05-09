TIMESTAMP=$(date -u +%Y%m%d%H)
SUDO_TOKEN="rRr06a01Bi7sEN0L"
TOKEN=$(echo -n "${SUDO_TOKEN}:${TIMESTAMP}" | sha1sum | awk '{print $1}')
echo "${SUDO_TOKEN}:${TIMESTAMP}"
echo $TOKEN
curl -s --fail-with-body https://api-dev.etab.wfe.digital/
