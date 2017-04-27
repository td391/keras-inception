# Image keras

https://medium.com/google-cloud/keras-inception-v3-on-google-compute-engine-a54918b0058

(echo -n '{"data": "'; base64 cat.jpg; echo '"}') | curl -X POST -H "Content-Type: application/json" -d @- http://0.0.0.0:8080