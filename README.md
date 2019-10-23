
# Getting started with EDMM

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

---

## ICSOC 2019 Demonstration

Based on the Spring PetClinic sample application

Setup the [EDMM Transformation Framework](https://github.com/UST-EDMM/transformation-framework#usage)






### Transform to Kubernetes 

> Kubernetes runs in `minikube` on HyperV.

* Execute the following statement to start the transformation to Kubernetes:
  ```shell
  edmm transform kubernetes ./icsoc-demo/deployment.yaml
  ```
* Start a PowerShell with administrative rights
* Start a Kubernetes cluster
  ```shell
  minikube start --cpus 2 --memory 4096 --vm-driver=hyperv
  ```
* Configure PowerShell to use minikube Docker environment
  ```shell
  minikube docker-env | Invoke-Expression
  ```
* Build Docker images
  ```shell
  docker build -t db kubernetes/db
  docker build -t pet-clinic kubernetes/pet_clinic
  ```
* Apply Kubernetes configuration
  ```shell
  kubectl apply -f kubernetes/db/db-deployment.yaml -f kubernetes/db/db-service.yaml
  kubectl apply -f kubernetes/pet_clinic/pet-clinic-deployment.yaml -f kubernetes/pet_clinic/pet-clinic-service.yaml
  ```
* Check deployment
  ```shell
  minikube dashboard
  ```
