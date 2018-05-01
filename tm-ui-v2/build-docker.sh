#!/usr/bin/env bash
docker build -t jbraeuer/tm-ui:backend-2 .
docker push jbraeuer/tm-ui:backend-2
cf push tm-ui-v3 -o jbraeuer/tm-ui:backend-2
