cd C:\dynatrace\repos\johannes-b\monolith\tm-ui-v2
docker build -t jbraeuer/tm-ui:backend .
docker push jbraeuer/tm-ui:backend
cf push tm-ui-v2 -o jbraeuer/tm-ui:backend