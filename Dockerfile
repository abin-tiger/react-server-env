FROM node:16.10 as build

WORKDIR /app/
COPY . .
RUN npm install
RUN npm run build


FROM nginx:1.17.1-alpine

COPY --from=build /app/build/ /usr/share/nginx/html/
RUN chown nginx:nginx /usr/share/nginx/html/*
