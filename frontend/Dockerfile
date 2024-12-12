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

# Add the runtime environment script
COPY ./set-env.sh ./set-env.sh
RUN chmod +x ./set-env.sh

# Expose port
EXPOSE 80

# Start nginx with runtime script
CMD ["sh", "-c", "./set-env.sh && nginx -g 'daemon off;'"]
