docker run -d -p 9000:9000 --name portainer -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce
docker-compose -f web-service/docker-compose.yml build
docker-compose -f hidden-service/docker-compose.yaml up 
docker-compose -f web-service/docker-compose.yml up 
