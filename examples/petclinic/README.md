
# Spring PetClinic Application

![](../../docs/images/petclinic_topology.png)

---

## Kubernetes

### Transform EDMM model

#### Using the EDMM CLI

```shell
edmm transform -r ../../modeling-repository kubernetes ./deployment.yml
```

#### Using the EDMM Modeling Tool

Open the topology template of the `PetClinic` application.
In the new browser window, click on `EDMM Transformation Check` and click on `do transformation` of the **Kubernetes** entry.
Extract the downloaded package to `./kubernetes`:
```shell
unzip kubernetes.zip -d ./kubernetes
```

### Start a Kubernetes Cluster on Windows

Start a PowerShell with administrative rights and start a Kubernetes cluster:
```shell
minikube start --cpus 2 --memory 4096 --vm-driver=hyperv
```

Configure PowerShell to use minikube's Docker environment:
```shell
minikube docker-env | Invoke-Expression
```

### Build Docker Containers

```shell
docker build -t db ./kubernetes/db
docker build -t petclinic ./kubernetes/petclinic
```

### Provisioning of the Application

```shell
kubectl apply -f ./kubernetes/db/db-config.yaml -f ./kubernetes/db/db-deployment.yaml -f ./kubernetes/db/db-service.yaml
kubectl apply -f ./kubernetes/petclinic/petclinic-config.yaml -f ./kubernetes/petclinic/petclinic-deployment.yaml -f ./kubernetes/petclinic/petclinic-service.yaml
```

### Launch the Application

```shell
minikube service pet-clinic-service
# or monitor
minikube dashboard
```

### Shutdown the Kubernetes Cluster

```shell
minikube delete
```

---

## Docker Compose

Execute the following statement to start the transformation to Kubernetes:
```shell
edmm transform -r ../../modeling-repository compose ./deployment.yml
```

Build Docker images:
```shell
docker-compose -f ./compose/docker-compose.yml build
```

Start Docker Compose configuration:
```shell
docker-compose -f ./compose/docker-compose.yml up
# you may need to restart the sample application
docker-compose -f ./compose/docker-compose.yml restart petclinic
```

Launch sample application:
Open a browser window and navigate to `http://{docker-hostname}:8080/petclinic`

Shutdown application:
```shell
docker-compose -f ./compose/docker-compose.yml down
```

---
