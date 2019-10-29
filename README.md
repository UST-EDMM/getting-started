
# Getting started with EDMM

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Prerequisites

* Git
* Maven
* minikube

## Setup

Clone the repository:

```shell script
git clone https://github.com/UST-EDMM/getting-started.git
git submodule update --init
```

Build the sample application:

```shell script
mvn -f ./spring-petclinic/pom.xml clean package -DskipTests
```

Setup the [EDMM Transformation Framework](https://github.com/UST-EDMM/transformation-framework#usage)

## Transform to Kubernetes 

> Kubernetes runs in `minikube` on HyperV.

* Execute the following statement to start the transformation to Kubernetes:
  
  ```shell script
  edmm transform kubernetes ./icsoc-demo/deployment.yaml
  ```

* Start a PowerShell with administrative rights and start a Kubernetes cluster:

  ```shell script
  minikube start --cpus 2 --memory 4096 --vm-driver=hyperv
  ```

* Configure PowerShell to use minikube's Docker environment

  ```shell script
  minikube docker-env | Invoke-Expression
  ```

* Build Docker images:

  ```shell script
  docker build -t db ./icsoc-demo/kubernetes/db
  docker build -t pet-clinic ./icsoc-demo/kubernetes/pet_clinic
  ```

* Apply Kubernetes configuration:

  ```shell script
  kubectl apply -f ./icsoc-demo/kubernetes/db/db-deployment.yaml -f ./icsoc-demo/kubernetes/db/db-service.yaml
  kubectl apply -f ./icsoc-demo/kubernetes/pet_clinic/pet-clinic-deployment.yaml -f ./icsoc-demo/kubernetes/pet_clinic/pet-clinic-service.yaml
  ```

* Launch sample application:

  ```shell script
  minikube service pet-clinic-service
  # or monitor
  minikube dashboard
  ```

* Shutdown application:

  ```shell script
  minikube stop
  minikube delete
  ```



## Transform to Docker Compose

* Execute the following statement to start the transformation to Kubernetes:
  
  ```shell script
  edmm transform compose ./icsoc-demo/deployment.yaml
  ```

* Build Docker images:

  ```shell script
  docker-compose -f .\icsoc-demo\compose\docker-compose.yml build
  ```

* Start Docker Compose configuration:

  ```shell script
  docker-compose -f .\icsoc-demo\compose\docker-compose.yml up
  # restart sample application
  docker-compose -f .\icsoc-demo\compose\docker-compose.yml restart pet-clinic
  ```

* Launch sample application:
  Open a browser window and navigate to `http://{docker-hostname}:8080/petclinic`

* Shutdown application:

  ```shell script
  docker-compose -f .\icsoc-demo\compose\docker-compose.yml down
  ```
