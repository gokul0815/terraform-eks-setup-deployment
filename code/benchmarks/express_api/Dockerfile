FROM node:latest

RUN mkdir /application
WORKDIR /application

RUN echo "checking version" && node -v && npm -v && echo "checking version"

COPY . .
RUN npm i 

EXPOSE 3000

RUN npm start
