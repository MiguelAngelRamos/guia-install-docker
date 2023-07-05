FROM nginx:alpine
# use a volume is mor efficient and speed that filesystem
VOLUME /tmp
RUN rm -rf /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY crudangular /usr/share/nginx/html
#expose app and 80 for nginx app
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]