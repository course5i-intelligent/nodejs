#Base Image node:12.18.4-alpine
FROM node:12.18.4-alpine


#Set working directory to /app
WORKDIR /app


#Set PATH /app/node_modules/.bin
ENV PATH /app/node_modules/.bin:$PATH


#Copy package.json in the image
COPY package.json ./


#Run npm install command
RUN apt -y update \
    && apt -y install curl \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt -y install nodejs


#Copy the app
COPY . ./

EXPOSE 3000

#Start the app
CMD ["node", "./src/test/server.test.js"]
