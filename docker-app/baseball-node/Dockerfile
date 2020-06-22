FROM node:10.16.3

WORKDIR /server
ENV NODE_ENV=production

RUN npm i node-pre-gyp -g
COPY package*.json /server/
RUN npm install

COPY . /server/

EXPOSE 8001
EXPOSE 8080

CMD ["npm", "start"]