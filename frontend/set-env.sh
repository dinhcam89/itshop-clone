#!/bin/sh

# Replace the placeholder with the runtime environment variable
echo "window.env = { REACT_APP_API_URL: '${REACT_APP_API_URL}' };" > /usr/share/nginx/html/env.js

# Ensure the generated file has the correct permissions
chmod 644 /usr/share/nginx/html/env.js
