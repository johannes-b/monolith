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

Build the latest version of the monolith:

```
mvn clean package -Pmysql,default
```

Define the manifest of TicketMonster in manifest.yml

```
---
applications:
- name: ticketMonster1
  memory: 1G
  instances: 1
  path: target/ticket-monster.war
  buildpack: https://github.com/cloudfoundry/java-buildpack.git
  services:
    - ticketMonster-mysql1
```

Push the application

```
cf push
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

```
mvn clean package -Pmysql,default
cf push
```