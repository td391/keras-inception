# Image keras

https://medium.com/google-cloud/keras-inception-v3-on-google-compute-engine-a54918b0058

## Local
```
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
cd service && python main.py
(echo -n '{"data": "'; base64 cat.jpg; echo '"}') | curl -X POST -H "Content-Type: application/json" -d @- http://0.0.0.0:8080
```

## Docker
```
docker build -t predict-service .
docker run -t -p 80:80 predict-service
```

