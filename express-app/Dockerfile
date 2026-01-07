FROM node:18-bullseye
WORKDIR /app
COPY express-app/package*.json ./
RUN npm cache clean --force
RUN npm install
COPY express-app ./
CMD ["node", "index.js"]
