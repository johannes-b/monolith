## Ticket Monster UI

This proxy helps us keep friendly URLs even when there are composite UIs or composite microservice REST APIs

It also helps us avoid tripping the browser Same Origin policy. We use a simple HTTP server (Apache) to serve the static content and then use the reverse proxy plugins to proxy REST calls to the appropriate microservice:

```
# proxy for the admin microserivce
ProxyPass "/rest" "http://ticket-monster:8080/rest"
ProxyPassReverse "/rest" "http://ticket-monster:8080/rest"
```

## Let Ticket Monster UI live on Cloud Foundry 

First, build the Docker image from the location containing the Dockerfile:

```
docker build -t jbraeuer/tm-ui:monolith .
```

Push Docker image to Docker Hub:
```
docker push jbraeuer/tm-ui:monolith
```

Push the application to Cloud Foundry by refering to the image on Docker Hub:
```
cf push tm-ui-v1 -o jbraeuer/tm-ui:monolith
```