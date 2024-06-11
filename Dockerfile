# Use the official Node.js image from the Docker Hub
FROM node:17-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY . .

EXPOSE 3030

CMD ["npm", "start"]
