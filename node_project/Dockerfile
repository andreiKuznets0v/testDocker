FROM node:10
WORKDIR /usr/src/app
COPY package*.json /usr/src/app/
RUN npm install; npm i @godaddy/terminus --save
# RUN npm ci --only=production
COPY . /usr/src/app/
EXPOSE 8080
CMD [ "node", "server.js" ]