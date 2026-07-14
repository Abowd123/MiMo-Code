FROM node:20-slim

RUN npm install -g @mimo-ai/cli

WORKDIR /app
COPY . .

EXPOSE 8080

CMD mimo web --port $PORT --hostname 0.0.0.0
