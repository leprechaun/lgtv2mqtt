FROM node:20-alpine

RUN mkdir -p /usr/node_app
COPY . /usr/node_app
WORKDIR /usr/node_app
RUN apk add --no-cache git python3 make gcc musl-dev g++
RUN npm install --production

CMD ["npm", "start"]
