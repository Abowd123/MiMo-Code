FROM node:20-slim

RUN apt-get update && apt-get install -y curl expect && \
    curl -fsSL https://mimo.xiaomi.com/install | bash

ENV PATH="/root/.mimocode/bin:${PATH}"

WORKDIR /app
COPY . .
RUN mkdir -p /app/web

EXPOSE 8080

CMD ["/bin/sh", "-c", "expect -c 'set timeout -1; spawn mimo web --port $env(PORT) --hostname 0.0.0.0; expect \"trust\"; send \"\\r\"; interact'"]
