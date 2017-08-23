#FROM node:6.5.0
FROM node:7.10.1

RUN apt-get update &&\
    apt-get install -y vim
# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Bundle app source
COPY . /app
RUN npm install

# Mount persistent storage
VOLUME /app/data
VOLUME /app/public/uploads

EXPOSE 3000
CMD [ "npm", "start" ]
