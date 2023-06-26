# Dockerfile

# Step 1: Start with a base image. Here we use the Node LTS (Long Term Support) version
FROM node:lts

# Step 2: Set working directory
WORKDIR /app

# Step 3: Add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Step 4: Install Vite
RUN npm install create-vite@latest

# Step 5: Initialize a new Vite project. If you want to use a template, you can do so here.
RUN npx create-vite my-app --template react

# Step 6: Change working directory to the Vite project
WORKDIR /app/my-app

# Step 7: Install dependencies
RUN npm install

# Step 8: Start the app
CMD ["npm", "run", "dev"]
