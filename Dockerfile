FROM ubuntu:22.04

RUN apt-get update && apt-get install -y nginx libnginx-mod-http-dav-ext curl

COPY nginx.conf /etc/nginx/
COPY server.crt /etc/nginx/
COPY server.key /etc/nginx/
COPY .htpasswd /home/

VOLUME /home/data

HEALTHCHECK --interval=120s --timeout=10s --retries=3 CMD curl -i https://localhost | head -n1 | grep 401

CMD nginx -g "daemon off;"
