FROM node:16.13.2-alpine3.15 as build-deps
WORKDIR /usr/src/app
RUN apk add git
RUN git clone https://github.com/darkxeno/cft-cv .
RUN npm install
RUN npm run build


FROM ubuntu:latest
RUN TZ="Europe/Madrid" apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log 
COPY --from=build-deps /usr/src/app/build  /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]