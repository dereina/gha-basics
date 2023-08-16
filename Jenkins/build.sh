#!/bin/sh

# Build the image
docker build -t myjenkins-blueocean:latest .
docker network create jenkins
docker network ls | grep jenkins && status=jenkins || status=''
echo $status
variable=jenkins
if [ "$status" = "$variable" ]; then
    echo "jenkins network found"

else
    echo "jenkins network not found"
    exit

fi