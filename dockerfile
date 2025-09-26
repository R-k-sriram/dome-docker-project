FROM node:20-alpine
WORKDIR /usr/src/app

# copy package.json then install
COPY package.json ./
RUN npm install --production

# copy app
COPY app.js ./

EXPOSE 3000
CMD ["npm", "start"]
