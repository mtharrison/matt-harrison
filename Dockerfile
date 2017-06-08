FROM node:6
MAINTAINER Matt Harrison <hi@matt-harrison.com>

ADD npm-shrinkwrap.json /src/

RUN cd /src && npm install

ADD package.json /src/
ADD *.js /src/
ADD content/ /src/content
ADD core/ /src/core

EXPOSE 2368
WORKDIR /src
CMD npm start
