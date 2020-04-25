# Use  docker image as a base
# here alpine is base image 
FROM node:alpine as builder

#working Directory
WORKDIR /app
# Download and install a Dependency

COPY package.json .
RUN npm install

COPY . .

#tell when to starts as acontainer
CMD ["npm","run", "build"]

# second phase for nginx 
FROM nginx
COPY --from=builder /app/build /usr/share/ndinx/html
