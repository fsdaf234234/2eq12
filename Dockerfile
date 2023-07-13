FROM golang:1.20-alpine as builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build 


FROM alpine:latest
WORKDIR /app
ADD . /app
EXPOSE 8080
CMD [ "/app/poe-openai-proxy" ]
