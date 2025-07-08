FROM alpine:latest

WORKDIR /app

ENV PB_VERSION=0.22.8

RUN apk add --no-cache curl unzip && \
    curl -L -o pocketbase.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip && \
    unzip pocketbase.zip && \
    rm pocketbase.zip && \
    chmod +x pocketbase

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
