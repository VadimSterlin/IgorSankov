FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy site files
COPY . /usr/share/nginx/html

# Clean up non-web files from html directory
RUN rm -f /usr/share/nginx/html/Dockerfile \
    /usr/share/nginx/html/nginx.conf \
    /usr/share/nginx/html/.dockerignore \
    /usr/share/nginx/html/README.md

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
