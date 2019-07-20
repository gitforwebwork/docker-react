# Multi Step Build Process

# Phase 1 - builder
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
CMD ["npm", "run", "build"]

# Phase 2 (no 'as', because it is the last phase)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80

