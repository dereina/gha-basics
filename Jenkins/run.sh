#!/bin/sh

# Run the image in a Container
docker run --name jenkins-blueocean --restart=on-failure --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:latest

docker ps

# You will need this password the first time you enter to Jenkins
echo "Use next password to login into Jenkins for the very first time"
docker exec jenkins-blueocean cat var/jenkins_home/secrets/initialAdminPassword

#enter the shell
#docker exec -it jenkins-blueocean bash 

