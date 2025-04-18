FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.27.4-alpine-slim
COPY --from=builder /app/build /usr/share/nginx/html
