Ft
FROM nginx:alpine
COPY static /usr/share/nginx/html
Buildt matthieubosquet/vocbench
run --rm -it -p 1979:1979 matthieubosquet/vocbench:latest
