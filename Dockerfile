# Use the official Node.js image as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Install PostgreSQL client tools
RUN apt-get update && apt-get install -y postgresql-client

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Generate Prisma client
RUN npx prisma generate

# Copy the entrypoint script
COPY entrypoint.sh .

# Ensure the entrypoint script is executable
RUN chmod +x entrypoint.sh

# Expose the port the app runs on
EXPOSE 3000

# Define the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
