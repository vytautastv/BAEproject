# Use official Nginx image
FROM nginx:alpine

# Copy static site files to nginx public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
