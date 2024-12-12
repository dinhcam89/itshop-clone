#!/bin/sh

# Replace the placeholder in the template with the runtime environment variable
envsubst < ./env.template.js > ./env.js

# Serve the modified file
chmod 644 ./env.js
