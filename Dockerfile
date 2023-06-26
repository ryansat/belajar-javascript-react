# Step 1: Start with a base image. Here we use the Node LTS (Long Term Support) version
FROM node:lts AS build

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy package.json and package-lock.json
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of your app's source code from your host to your image filesystem.
COPY . ./

# Step 6: Build the app
RUN npm run build

# Step 7: Start with Nginx base image
FROM nginx:stable-alpine

# Step 8: Copy over the built app to Nginx's serve folder
COPY --from=build /app/dist /usr/share/nginx/html

# Step 9: Copy over the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Step 10: Expose port 80 for the app
EXPOSE 80

# Step 11: Start Nginx
CMD ["nginx", "-g", "daemon off;"]
