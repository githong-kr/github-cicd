FROM node:21-alpine

RUN mkdir -p /usr/app
WORKDIR /usr/app

COPY ./ /usr/app

RUN npm ci
RUN npm run build

RUN npm install -g pm2

EXPOSE 3000

CMD ["pm2-runtime", "start", "ecosystem.config.js"]