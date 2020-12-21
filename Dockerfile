FROM nginx:alpine
COPY static /usr/share/nginx/html
run --rm -it -p 1979:1979 matthieubosquet/vocbench:latest
