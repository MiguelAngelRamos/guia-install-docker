```sh
FROM node:18-alpine as build

WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g @angular/cli
RUN npm run build
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/crudangular /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

## By Ignacio Seco
```
