FROM node:20 AS builder

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build --prod

FROM nginx:alpine

COPY --from=builder /app/dist/harness-demo-app/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]