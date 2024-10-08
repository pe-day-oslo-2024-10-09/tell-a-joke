# Base the image on the node base image
FROM node:lts-alpine

# Define container where the app will be placed
WORKDIR /usr/src/app

# Play nicely with caching
# node ependancies are defined in package.json and package-log.json 
COPY package*.json ./
RUN npm install --only=prod

COPY . .

# Define which port should be exposed on the container
EXPOSE 3000

# The command to run when the container starts
ENTRYPOINT [ "node", "./bin/www" ]
