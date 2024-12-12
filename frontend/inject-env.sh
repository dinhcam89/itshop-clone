#!/bin/sh

# Generate env.js with runtime environment variables
echo "Generating /usr/share/nginx/html/env.js with REACT_APP_ variables..."
echo "window.env = {" > /usr/share/nginx/html/env.js

# Extract environment variables prefixed with REACT_APP_ and format them as JavaScript properties
printenv | grep REACT_APP_ | sed 's/^\(.*\)=\(.*\)$/  "\1": "\2",/' >> /usr/share/nginx/html/env.js

# Replace the placeholders with actual values
echo "Replacing placeholders in env.js..."
sed -i "s|__api_url_active__|$REACT_APP_API_URL_ACTIVE|g" /usr/share/nginx/html/env.js
sed -i "s|__api_url_preview__|$REACT_APP_API_URL_PREVIEW|g" /usr/share/nginx/html/env.js

# Remove the trailing comma to ensure valid JSON
sed -i '$ s/,$//' /usr/share/nginx/html/env.js

# Close the JavaScript object
echo "};" >> /usr/share/nginx/html/env.js

echo "/usr/share/nginx/html/env.js generated successfully."

# Execute the original CMD passed to the container
exec "$@"
