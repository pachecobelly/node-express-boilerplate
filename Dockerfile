FROM node:alpine

# ADICIONE ESTA LINHA
ENV NODE_ENV=production

RUN mkdir -p /usr/src/node-app && chown -R node:node /usr/src/node-app

WORKDIR /usr/src/node-app

COPY package.json package-lock.json ./

USER node

RUN npm ci

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "src/index.js" ]