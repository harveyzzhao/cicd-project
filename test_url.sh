#!/bin/bash

# URL to test
URL="http://localhost:3000"

# send a request to the URL and capture the HTTP status code
HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)

# check if the HTTP sttaus code is 200
if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "URL $URL is reachable and returned status code 200."
    exit 0
else
    echo "URL $URL is not reachable or did not return status code 200. Status code: $HTTP_STATUS"
    exit 1
fi