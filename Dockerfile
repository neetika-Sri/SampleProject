FROM node:9-slim
ENV PORT 8080
EXPOSE 8080


RUN mkdir -p /usr/local/app/sources/

WORKDIR /usr/local/app/sources/

 COPY .babelrc ./
 COPY package.json ./
 COPY yarn.lock ./
 RUN yarn

 COPY ./src ./src

 RUN yarn build

 WORKDIR /usr/local/app/

 RUN mv ./sources/build/* .
 RUN mv ./sources/node_modules ./node_modules
 RUN rm -rf ./sources/

 CMD ["node", "index.js",'npm',"start"]