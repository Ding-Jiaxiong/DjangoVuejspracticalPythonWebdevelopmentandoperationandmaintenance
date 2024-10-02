import requests

url = "http://localhost:8000/goods/goods"

response = requests.get(url)
print(response.text)