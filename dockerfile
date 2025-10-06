FROM node:20-alpine

WORKDIR /usr/src/app

# Clone repo directly
RUN apk add --no-cache git \
    && git clone https://github.com/<your-username>/<your-repo>.git .

RUN npm install --production
EXPOSE 3000
CMD ["npm", "start"]
