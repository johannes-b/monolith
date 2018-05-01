#### DOCKER image
# build docker image
see build-docker.sh

# push Docker image to Docker Hub
$ docker push jbraeuer/backend:v1

# push Docker image from Docker Hub to CF
$ cf push backend-v1 --docker-image jbraeuer/backend:v1