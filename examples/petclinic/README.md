
# Spring PetClinic Application

> PetClinic demonstrates the use of the Spring Boot framework.
> The PetClinic has an old and varied history dating right back to the beginning of the Spring Framework.
> It started life as a demonstration of nearly all the common things that you could do with Spring, back when it was possible to conceive of such a demonstration.
> These days it is a very small slice of what you could achieve, but the community has a soft spot for it, so it's nice to see it still going after all this time, so we hope you enjoy it too.

Next figure shows the overall application structure modeled using EDMM.
The topology can be transformed into the files and templates required by a certain deployment automation technology, which is described below in detail for a couple of technologies.

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

Build Docker containers:
```shell
docker-compose -f ./compose/docker-compose.yml build
```

Deploy the application:
```shell
docker-compose -f ./compose/docker-compose.yml up
# you may need to restart the "petclinic-service" service
docker-compose -f ./compose/docker-compose.yml restart petclinic-service
```

Launch sample application:
Open a browser window and navigate to `http://{docker-hostname}:8080/petclinic`

Shutdown environment:
```shell
docker-compose -f ./compose/docker-compose.yml down
```

---

## Ansible

Execute the following statement to start the transformation to Ansible:
```shell
edmm transform -r ../../modeling-repository ansible ./deployment.yml
```

Open the `*_props.json` file and adapt the following properties:
- `PUBLIC_ADDRESS`: the public IP address where the software components should be installed on
- `DB_HOSTNAME`: the public IP address of the VM hosting the database components

Deploy the application:
```shell
ansible-playbook deployment.yml
```

Launch application:
Open a browser window and navigate to `http://<public address of ubuntu_app component>:8080/petclinic`
