#Base Image node:12.18.4-alpine
FROM node:12.18.4-alpine


#Set working directory to /app
WORKDIR /app


#Set PATH /app/node_modules/.bin
ENV PATH /app/node_modules/.bin:$PATH


#Copy package.json in the image
COPY package.json ./


#Run npm install command
RUN sudo apt update
RUN sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN sudo apt -y install nodejs
RUN sudo apt -y install npm


#Copy the app
COPY . ./

EXPOSE 3000

#Start the app
CMD ["node", "./src/test/server.test.js"]
