#!/bin/bash

echo "Building Docker image..."
docker build -t password-generator .

echo "Stopping existing container (if any)..."
docker stop pg-container 2>/dev/null
docker rm pg-container 2>/dev/null

echo "Starting new container..."
docker run -d -p 8080:80 --name pg-container password-generator

echo "App deployed to http://localhost:8080 🚀"
