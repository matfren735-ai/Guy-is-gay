FROM node:22-alpine
RUN apk add --no-cache unzip
COPY *.zip /tmp/app.zip
RUN mkdir -p /app /tmp/x && unzip -q /tmp/app.zip -d /tmp/x && cp -r "$(dirname "$(find /tmp/x -name server.js | head -1)")"/. /app/
WORKDIR /app
ENV NODE_ENV=production PORT=3000 TRUST_PROXY=1 DB_FILE=/data/data.sqlite
RUN mkdir -p /data
EXPOSE 3000
CMD ["node", "server.js"]
