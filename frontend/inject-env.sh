#!/bin/sh

# Generate env.js with runtime environment variables
echo "window.env = {" > /usr/share/nginx/html/env.js
printenv | grep REACT_APP_ | sed 's/^\(.*\)=\(.*\)$/  "\1": "\2",/' >> /usr/share/nginx/html/env.js
echo "};" >> /usr/share/nginx/html/env.js

exec "$@"
