﻿# Fearless Monolith to Microservices Migration – A guided journey

This repository is a clone from [ticket-monster-msa/monolith](https://github.com/ticket-monster-msa/monolith) maintained by Christian Posta, who gave permission to reuse it for this cloud migration showcase.

The repository is a monorepo of projects that illustrate migrating a monolith application (TicketMonster) to microservices on Cloud Foundry. For this journey, a blog post series explains the required concepts and best practices. Open the initial blog: [Fearless Monolith to Microservices Migration – A guided journey](https://blog-authoring.lab.dynatrace.org/news/blog/fearless-monolith-to-microservices-migration-a-guided-journey/) that guides you through the different stages in a structured manner. (A summary of the steps is shown in the Instructions section below.) 

## Overview

There are a series of projects* used to illustrate a migration to microservices from a Java EE monolith. (*more are coming as the blog series grows)

### monolith
The getting started experience begins with the [monolith](./monolith/README.md) project. In this project we deploy our monolith application and understand the domain, architecture, and structure of the application that will be the foundation for successive iterations.
 
 
### tm-ui
<!-- 
The `tm-ui-*` folders contain different versions of the front-facing UI that we use as we migrate from a monolith to split out the UI to the set of microservices.
-->
The [tm-ui-v1](./tm-ui-v1/README.md) folder contains a version of the front-facing UI that we use as we migrate from a monolith to split out the UI to the set of microservices.

<!-- 
### backend

The `backend-*` folders contain the monolith with the UI removed and successive iterations of evolution. With `backend-v1`, we have taken the monolith as it is and removed the UI. It contains a REST API that can be called from the UI. In `backend-v2` we've stated adding feature flags for controlling the introduction of a new microservice. See each respective sub project for more information.
  
### orders-service

-->

## Instructions

**1. Clone the repository**
```sh
$ git clone https://github.com/johannes-b/monolith.git
$ cd monolith
```

**2. Lift-and-shift TicketMonster to Cloud Foundry**

* In directory `monolith`, follow the [Instructions](./monolith/README.md) to run TicketMonster on Cloud Foundry.

**3. Set a new UI in front of TicketMonster**

* In directory `tm-ui-v1`, follow the [Instructions](./tm-ui-v1/README.md) to set an independent UI in front of TicketMonster. 


 

