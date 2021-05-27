# Use NodeJS base image
FROM node:13

# Create app directory in Docker
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies in Docker
RUN npm install

# Copy app from local environment into the Docker image
COPY . .
ARG argPOSTGRES_USERNAME
ARG argPOSTGRES_PASSWORD
ARG argPOSTGRES_HOST
ARG argPOSTGRES_DB
ARG argAWS_BUCKET
ARG argAWS_REGION
ARG argAWS_PROFILE
ARG argJWT_SECRET
ARG argURL
ENV POSTGRES_USERNAME=$argPOSTGRES_USERNAME
ENV POSTGRES_PASSWORD=$argPOSTGRES_PASSWORD
ENV POSTGRES_HOST=$argPOSTGRES_HOST
ENV POSTGRES_DB=$argPOSTGRES_DB
ENV AWS_BUCKET=$argAWS_BUCKET
ENV AWS_REGION=$argAWS_REGION
ENV AWS_PROFILE=$argAWS_PROFILE
ENV JWT_SECRET=$argJWT_SECRET
ENV URL=$argURL


# Set the API’s port number
EXPOSE 8080

# Define Docker’s behavior when the image is  run
CMD ["npm", "run", "prod"]