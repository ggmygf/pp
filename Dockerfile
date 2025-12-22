FROM alpine:latest
RUN apk add --no-cache curl bash
WORKDIR /app
# Install Sing-box (the engine that runs Reality)
RUN curl -L https://github.com/SagerNet/sing-box/releases/download/v1.8.5/sing-box-1.8.5-linux-amd64.tar.gz | tar -xz --strip-components=1
COPY config.json .
EXPOSE 8080
CMD ["./sing-box", "run"]
