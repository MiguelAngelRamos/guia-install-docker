# Base image
FROM ubuntu:latest


RUN apt-get update \
    && apt-get install -y nginx


RUN apt-get install -y openjdk-17-jdk


ARG JAR_FILE=target/devops-apirest-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar


VOLUME /tmp
RUN rm -rf /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY dist/crudangular /usr/share/nginx/html


EXPOSE 80 8080


CMD service nginx start && java -jar app.jar