
FROM nginx:alpine
COPY static /usr/share/nginx/html
DOCKER RUN -p80:80 matthieubosquet/vocbench:lates
