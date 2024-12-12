#!/bin/sh

# Generate env.js with runtime environment variables
echo "window.env = {" > /usr/share/nginx/html/env.js

# Add REACT_APP_API_URL_ACTIVE and REACT_APP_API_URL_PREVIEW dynamically from the environment variables
echo "  REACT_APP_API_URL_ACTIVE: \"$REACT_APP_API_URL_ACTIVE\"," >> /usr/share/nginx/html/env.js
echo "  REACT_APP_API_URL_PREVIEW: \"$REACT_APP_API_URL_PREVIEW\"" >> /usr/share/nginx/html/env.js

# Close the window.env object
echo "};" >> /usr/share/nginx/html/env.js

# Print the env.js file for verification (optional)
cat /usr/share/nginx/html/env.js

# Start Nginx
exec "$@"
