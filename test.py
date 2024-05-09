import requests


r = requests.get("https://api-dev.etab.wfe.digital/")
print(r.status_code)
print(r.text)