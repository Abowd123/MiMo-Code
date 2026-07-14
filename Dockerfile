FROM node:20-slim

RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://mimo.xiaomi.com/install | bash

ENV PATH="/root/.mimocode/bin:${PATH}"

WORKDIR /app
COPY . .

EXPOSE 8080

CMD ["/bin/sh", "-c", "mimo serve --port $PORT --hostname 0.0.0.0"]
