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
ENV POSTGRES_USERNAME=$POSTGRES_USERNAME
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD
ENV POSTGRES_HOST=$POSTGRES_HOST
ENV POSTGRES_DB=$POSTGRES_DB
ENV AWS_BUCKET=$AWS_BUCKET
ENV AWS_REGION=$AWS_REGION
ENV AWS_PROFILE=$AWS_PROFILE
ENV JWT_SECRET=$JWT_SECRET
ENV URL=$URL


# Set the API’s port number
EXPOSE 8080

# Define Docker’s behavior when the image is  run
CMD ["npm", "run", "prod"]