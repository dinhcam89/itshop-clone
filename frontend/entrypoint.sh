#!/bin/sh

# Replace the placeholder with the environment variable value
sed -i "s|__REACT_APP_API_URL__|${REACT_APP_API_URL}|g" /usr/share/nginx/html/static/js/*.js

# Start Nginx
exec nginx -g "daemon off;"
