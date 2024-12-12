# Build stage
FROM node:18-alpine as build

WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Add a placeholder for env.js
RUN echo "window.env = {};" > public/env.js

# Build application
RUN npm run build

# Production stage
FROM nginx:alpine

# Copy built assets from build stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port
EXPOSE 80

# Add a script to inject environment variables into env.js at runtime
COPY ./inject-env.sh /docker-entrypoint.d/

# Make the script executable
RUN chmod +x /docker-entrypoint.d/inject-env.sh

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
