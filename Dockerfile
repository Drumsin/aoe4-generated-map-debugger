FROM node:18.14.0-alpine3.17

RUN apk update && apk upgrade

ADD . .

RUN npm install && npm install -D webpack-dev-server && npm run build

CMD [ "npx", "webpack", "serve" ]