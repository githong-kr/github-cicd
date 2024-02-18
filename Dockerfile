FROM node:21-alpine

ENV SERVER_HOME /usr/app

RUN mkdir -p ${SERVER_HOME}
WORKDIR ${SERVER_HOME}
 
COPY ./ ${SERVER_HOME}
 
RUN npm ci
RUN npm run build

RUN npm install -g pm2

EXPOSE 3000

CMD ["pm2-runtime", "start", "ecosystem.config.js"]