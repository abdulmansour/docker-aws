FROM node:16-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

# outputs static files inside /app/build
RUN npm run build

FROM nginx:alpine
# expose 80 is required for elasticbeanstalk to map to that port for incoming traffic
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
