FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#Expose is usually used as a documentation between developers
#Elastic Beanstalk however uses this instruction for port mapping
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html