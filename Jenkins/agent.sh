#!/bin/sh

# Run docker registry
docker run -d -p 5000:5000 --restart always --name registry registry:2

# Build the agent
docker build -t myjenkins-agent -  < Dockerfile.agent 

# Push image to local registry. Jenkins can find it here
docker tag myjenkins-agent localhost:5000/myjenkins-agent:latest

docker push localhost:5000/myjenkins-agent:latest