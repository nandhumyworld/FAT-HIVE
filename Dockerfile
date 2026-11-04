# The FAT Hive — static site served by nginx (for Coolify)
FROM nginx:1.27-alpine

# Replace the default server block with ours
RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/app.conf

# Copy only the site files (no Dockerfile / README / nginx.conf in the webroot)
COPY index.html /usr/share/nginx/html/index.html
COPY modules/ /usr/share/nginx/html/modules/
COPY assets/  /usr/share/nginx/html/assets/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1
