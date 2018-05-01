#!/usr/bin/env bash
mvn clean install -Pmysql fabric8:build -Ddocker.image.name=jbraeuer/backend:v2



cd C:\dynatrace\repos\ticket-monster-msa\monolith\backend-v2
mvn clean install -P mysql fabric8:build -D docker.image.name=jbraeuer/backend:v2
cd .\target\docker\jbraeuer\backend\v2\build\
docker build -t jbraeuer/backend:v2 .
docker push jbraeuer/backend:v2
cf push backend-v2 -o jbraeuer/backend:v2
