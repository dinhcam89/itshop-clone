# Build stage
FROM node:18-alpine as build

WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build application
RUN npm run build

# Production stage
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copy built assets from build stage
COPY --from=build /app/build .

# Add a script to dynamically replace the API URL
COPY ./set-env.sh ./set-env.sh
RUN chmod +x ./set-env.sh

# Add the template for environment variables
COPY ./env.template.js ./env.template.js

# Expose port
EXPOSE 80

# Start nginx with the environment setup script
CMD ["sh", "-c", "./set-env.sh && nginx -g 'daemon off;'"]
