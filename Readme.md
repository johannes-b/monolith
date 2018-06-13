# Ticket Monster Monolith to Microservices

This is project is a monorepo of projects that illustrate migrating a monolith application to microservices on Cloud Foundry.

The blog series that explains this migration journey can be found here: [this blog series](https://blog-authoring.lab.dynatrace.org/news/blog/fearless-monolith-to-microservices-migration-a-guided-journey/)

## Overview

There are a series of projects used to illustrate a migration to microservices from a Java EE monolith. 

### monolith
The getting started experience begins with the [monolith](./monolith/README.md) project. In this project we deploy our monolith application and understand the domain, architecture, and structure of the application that will be the foundation for successive iterations.
 
 
### tm-ui
<!-- 
The `tm-ui-*` folders contain different versions of the front-facing UI that we use as we migrate from a monolith to split out the UI to the set of microservices.
-->
The `tm-ui-v1` folder contains a version of the front-facing UI that we use as we migrate from a monolith to split out the UI to the set of microservices.

<!-- 
### backend

The `backend-*` folders contain the monolith with the UI removed and successive iterations of evolution. With `backend-v1`, we have taken the monolith as it is and removed the UI. It contains a REST API that can be called from the UI. In `backend-v2` we've stated adding feature flags for controlling the introduction of a new microservice. See each respective sub project for more information.
  
### orders-service

-->

## Prerequisites

* Make sure you have [Cloud Foundry CLI](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html) installed 

## Instructions

**1. Clone the repository**
```sh
$ git clone https://github.com/johannes-b/monolith.git
$ cd monolith
```

**2. Setup 'ticket-monster' on Cloud Foundry**
To setup the TicketMonster application, see the [Instruction](./monolith/README.md) in folder monolith.

**3. Set 'tm-ui-v1' UI in front of 'ticket-monster'**
Afterwards, set the tm-ui-v1 in front of the monolith. Therefore, the [Instruction](./tm-ui-v1/README.md) are in tm-ui-v1.


 

