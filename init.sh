#!/bin/bash

# Check if Vite is installed, if not, install it
if ! command -v create-vite &> /dev/null
then
    echo "Create Vite not found! Installing..."
    npm install -g create-vite
fi

# Create a new Vite project with a React template
npx create-vite my-react-app --template react

# Move into the new project directory
cd my-react-app

# Install dependencies
npm install

# Start the Vite development server
npm run dev
