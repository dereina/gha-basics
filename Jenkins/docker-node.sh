#!/bin/sh

# Create Node, alpine/socat container to forward traffic from Jenkins to Docker on Host Machine to have a node to to run agents...
docker run --name dockercloud -d --restart=always -p 127.0.0.1:2377:2375 --network jenkins -v /var/run/docker.sock:/var/run/docker.sock alpine/socat tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock

# Get container name

docker_name=$(docker ps -aqf 'name=^dockercloud$')

echo "Container ID:"
echo $docker_name

# Get the IP Address to configure a Cloud or Node in Jenkins
docker inspect $docker_name | grep IPAddress

# Possible Output
#c909edbe0d4145c2272ac1823aadcb49117735388773352dfddbc138c9b48519
#Container ID:
#c909edbe0d41
#            "SecondaryIPAddresses": null,
#            "IPAddress": "",
#                    "IPAddress": "172.18.0.4",