# Monolith TicketMonster

This is the monolith version of the TicketMonster app from the [tutorial on developers.redhat.com](https://developers.redhat.com/ticket-monster/).


This project illustrates the following concepts:

* App running in WildFly 10.x (EE 7)
* Connecting to a separate instance of `mysql` database
* Deploying to Cloud Foundry


## Running TicketMonster

From the command line, you can run the application simply in a WildFly 10.x application server as simple as this:

```
mvn clean package wildfly:run
```

This builds the application with an embedded database and bootstraps an embedded application server and deploys the service available at [http://localhost:8080/ticket-monster](http://localhost:8080/ticket-monster). Give it a try to make sure everything comes up correctly.


## For developers: Building TicketMonster

TicketMonster can be built from Maven, by running the following Maven command:

```
mvn clean package
```
	
### Building TicketMonster with MySQL 

If you want to build the WAR with support for MySQL database, build with the following profiles:

```
mvn clean package -Pmysql,default
```
       
Note, we explicitly enable the `mysql` profile and also the `default` profile. We keep the default profile around to skip integration tests. Leave it off to run them.   

	
### Building TicketMonster with MySQL on Cloud Foundry

First you should deploy a `mysql` instance. 

Deploy the `mysql` Cloud Foundry service:

```
cf create-service p-mysql 100mb ticketMonster-mysql
```

Build the latest version of the monolith as Docker container:

```
mvn clean install -P mysql fabric8:build -D docker.image.name=jbraeuer/ticket-monster-mysql:latest
```

Move to Docker file and push container image to Docker Hub:
```
cd .\target\docker\jbraeuer\ticket-monster-mysql\latest\build
docker push jbraeuer/ticket-monster-mysql:latest
```

Push the application to Cloud Foundry by using the container image on Docker Hub:

```
cf push ticket-Monster --docker-image jbraeuer/ticket-monster-mysql:latest
```

Get binding information and set database connection in standalone.xml

```
cf env ticketMonster1
```

```
<datasource jndi-name="java:jboss/datasources/MySQLDS" pool-name="MySQLDS">
    <connection-url>jdbc:mysql://10.0.16.54:3306/cf_b67dba92_e214_4bdb_96c4_aebd5f986425</connection-url>
    <driver>mysql</driver>
       <security>
            <user-name>md8ZiMyOvdae9G2s</user-name>
            <password>noCfHlaDbyaxcRXG</password>
        </security>
</datasource>
```

Rebuild TicketMonster, push to Docker Hub, and push to Cloud Foundry:
```
mvn clean install -P mysql fabric8:build -D docker.image.name=jbraeuer/ticket-monster-mysql:latest
cd .\target\docker\jbraeuer\ticket-monster-mysql\latest\build
docker push jbraeuer/ticket-monster-mysql:latest
cf push ticket-Monster --docker-image jbraeuer/ticket-monster-mysql:latest
```