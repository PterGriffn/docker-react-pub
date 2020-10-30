# step 1: create the build
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# step 2: the build now will be in /app/build dir, copy it to nginx 
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html