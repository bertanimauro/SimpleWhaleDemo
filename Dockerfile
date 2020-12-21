
FROM nginx:alpine
COPY static /usr/share/nginx/html
docker pull matthieubosquet/vocbench
docker run --rm -it -p 1979:1979 matthieubosquet/vocbench:latest
