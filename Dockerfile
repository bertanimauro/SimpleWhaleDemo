
FROM nginx:alpine
COPY static /usr/share/nginx/html
docker run -p80:80
