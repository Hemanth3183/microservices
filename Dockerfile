# To download the base image
FROM node:16-alpine AS builder
WORKDIR '/app'

# Copy package.json file and install dependencies
COPY ./package.json ./
RUN npm install
COPY ./ ./

#Build the application
RUN npm run build


# Download NGINX image
FROM nginx
EXPOSE 80

# Copy build from builder step
COPY --from=builder /app/build /usr/share/nginx/html