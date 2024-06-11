FROM node:17-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


FROM node:17-alpine

WORKDIR /app

COPY --from=build /app .


RUN npm install --only=production


EXPOSE 3030

CMD ["npm", "start"]