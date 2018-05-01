#### The CF way
# create a service instance
$ cf create-service p-mysql 100mb ticketMonster-mysql

# bind the service instance to the application
$ cf bind-service ticketMonster ticketMonster-mysql

# restart the application so the new service is detected
$ cf restart ticketMonster


#### DOCKER image
# build docker image
mvn clean install -Pmysql fabric8:build -Ddocker.image.name=jbraeuer/ticket-monster-mysql:latest

# push Docker image to Docker Hub
$ docker push jbraeuer/ticket-monster-mysql:latest

# push Docker image from Docker Hub to CF
$ cf push ticket-Monster --docker-image jbraeuer/ticket-monster-mysql:latest