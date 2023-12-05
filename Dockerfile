# Base image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
# COPY package-lock.json ./


# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

ENV DB_USERNAME=avnadmin
ENV DB_PASSWORD=AVNS_Nza7lFkOogE1Nrqt3yr
ENV DB_NAME=defaultdb
ENV DB_HOSTNAME=mysql-1c56fa7e-kayodeakinmboni-8441.a.aivencloud.com
ENV DB_PORT=21132

# Creates a "dist" folder with the production build
RUN npm run build

EXPOSE 3000

# Start the server using the production build
CMD [ "node", "dist/main.js" ]