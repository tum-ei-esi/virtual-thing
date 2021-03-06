FROM node:10.16.0-alpine

WORKDIR "/app"

COPY package.json .
RUN apk add --no-cache make gcc g++ python
RUN npm install
COPY . .
RUN npm run build

CMD ["node", "dist/auto-test.js"]
