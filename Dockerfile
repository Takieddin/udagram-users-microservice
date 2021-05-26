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
ENV POSTGRES_USERNAME=postgres
ENV POSTGRES_PASSWORD=12345678
ENV POSTGRES_HOST=database-2.cxcbmurvtd20.us-west-2.rds.amazonaws.com
ENV POSTGRES_DB=postgres
ENV AWS_BUCKET=arn:aws:s3:::microservice-udacity
ENV AWS_REGION=us-west-2
ENV AWS_PROFILE=default
ENV JWT_SECRET=hello
ENV URL=*


# Set the API’s port number
EXPOSE 80

# Define Docker’s behavior when the image is  run
CMD ["npm", "run", "prod"]