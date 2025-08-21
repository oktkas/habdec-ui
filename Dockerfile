# Use the official Nginx image as the base
FROM nginx:alpine

# Install envsubst (if not already available)
RUN apk add --no-cache gettext

# Set the working directory
WORKDIR /usr/share/nginx/html

# Remove the default Nginx static files
RUN rm -rf ./*

# Copy the 'www' directory from the repository to Nginx's HTML directory
COPY www/ .

# Copy the entrypint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set default environment variables
ENV HABDEC_SERVER_URL="ws://localhost:5555"

# Expose port 80
EXPOSE 80

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
