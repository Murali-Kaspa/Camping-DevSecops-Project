#IMAGENAME: muralikaspa1998/campimage	

# Use Node 18 as parent image
FROM node:18-alpine

# Add maintainer info
LABEL maintainer="Murali Kaspa"

# Change the working directory on the Docker image to /app
WORKDIR /app

# Copy package.json and package-lock.json to the /app directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of project files into this image
COPY . .

# Expose application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]

