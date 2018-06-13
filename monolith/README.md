# Monolith TicketMonster

This is the monolith version of the TicketMonster app from the [tutorial on developers.redhat.com](https://developers.redhat.com/ticket-monster/).


This project illustrates the following concepts:

* App running in WildFly 10.x (EE 7)
* Connection to a separate instance of `mysql` database
* Deployment to Cloud Foundry

## Prerequisites

* Requires access to a PCF Cluster
* Make sure you have [Cloud Foundry CLI](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html) installed 
* You need [Maven](https://maven.apache.org/) to build the monolith
* You need [Docker](https://www.docker.com/community-edition) to create a Docker image 
* Sign In to your Docker Hub Account

## Instructions

**0. See [Instructions]() and change directory**
```sh
$ cd monolith
```

**1. Deploy the `mysql` Cloud Foundry service instance using the 100mb plan**
```sh
$ cf create-service p-mysql 100mb ticketMonster-mysql
```


**2. Build the latest version of the monolith as Docker image**
```sh
$ mvn clean install -P mysql fabric8:build -D docker.image.name=<dockerhub account>/ticket-monster-mysql:latest
```

**3. Move to Dockerfile and push Docker image to Docker Hub**
```sh
$ cd .\target\docker\<dockerhub account>\ticket-monster-mysql\latest\build
$ docker push <dockerhub account>/ticket-monster-mysql:latest
```

**4. Push the application to Cloud Foundry by refering to the container image on Docker Hub**
```sh
$ cf push ticket-monster --docker-image <dockerhub account>/ticket-monster-mysql:latest
```

**5. Bind the `mysql` service instance to the application**
```sh
$ cf bind-service ticket-monster ticketMonster-mysql
```

**6. Get binding information (jdbcUrl, name and password) and set environment variables: database connection-url, user-name, and password to these values**
```sh
$ cf env ticket-monster
$ cf set-env ticket-monster CONNECTION-URL jdbc:mysql://***
$ cf set-env ticket-monster USER-NAME ***
$ cf set-env ticket-monster PASSWORD ***
```

**7. Restage application to ensure your environment variable changes take effect**
```sh
cf restage ticket-monster
```

## Appendix

### Running TicketMonster locally

From the command line, you can run the application in a WildFly 10.x application server as simple as this:

```
mvn clean package wildfly:run
```

This builds the application with an embedded database, bootstraps an embedded application server and deploys the service available at [http://localhost:8080/ticket-monster](http://localhost:8080/ticket-monster).


### Building TicketMonster

TicketMonster can be built from Maven by running the following Maven command:

```
mvn clean package
```
	
### Building TicketMonster with MySQL 

If you want to build the WAR with support for MySQL database, build with the following profiles:

```
mvn clean package -Pmysql,default
```
       
Note, we explicitly enable the `mysql` profile and also the `default` profile. We keep the default profile around to skip integration tests. Leave it off to run them.   