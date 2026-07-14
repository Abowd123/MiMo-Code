FROM node:20-slim

RUN apt-get update && apt-get install -y curl expect && \
    curl -fsSL https://mimo.xiaomi.com/install | bash

ENV PATH="/root/.mimocode/bin:${PATH}"

WORKDIR /app
COPY . .
RUN mkdir -p /app/web

RUN printf '#!/usr/bin/expect -f\nset timeout -1\nspawn mimo web --port $env(PORT) --hostname 0.0.0.0\nexpect "trust"\nsend "\\r"\ninteract\n' > /start.sh && chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
