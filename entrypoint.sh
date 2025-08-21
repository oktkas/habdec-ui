#!/bin/sh
# entrypoint.sh

# Substitute environment variables in the template
envsubst '${HABDEC_SERVER_URL}' < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html

# Execute the main command
exec "$@"