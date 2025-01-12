FROM ubuntu:22.04

RUN apt-get update && apt-get install -y nginx libnginx-mod-http-dav-ext

COPY nginx.conf /etc/nginx/
COPY server.crt /etc/nginx/
COPY server.key /etc/nginx/
COPY .htpasswd /home/

VOLUME /home/data

CMD nginx -g "daemon off;"

