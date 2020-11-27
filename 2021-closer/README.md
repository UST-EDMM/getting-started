
## Automating the Deployment of Distributed Applications by CombiningMultiple Deployment Technologies

### Motivating Scenario

The [overall EDMM model](01_edmm) defines our case study scenario to deploy a Java application connecting to a MySQL database at runtime.
It was modeled and exported using the [EDMM Modeling Tool](https://github.com/eclipse/winery).

Afterwards, the exported EDMM deployment [model](01_edmm/deployment.yml) was extended by the newly introduced syntax to define the deployment technology that should be used to deploy specific components.
The `technology_regions` block defines the deployment technology, e.g., Ansible, and the respective components that should be deployed with this technology.

From here, the [EDMM Transformation Framework](https://github.com/UST-EDMM/transformation-framework) is used in **multi deployment** mode to divide the overall EDMM model into EDMM model fragments and to transform these deployable fragments into the _deployment technology-specific model_ (DTSM) of the chosen deployment technologies.
For the case study, the result is available [here](02_dtsm) where separate DTSMs have been created.

At this stage, our prototype employs a plugin-based orchestration component which derives the execution order from the overall EDMM model, the user-defined technology regions, and the resulting deployable EDMM model fragments. 
The EDMM Transformation Framework currently will trigger the respective *Execution Plugin* to trigger the deployment based on a given DTSM.
Further, it also implements the capability to *retrieve*, *store*, and *distribute* input and outputs before and after each workflow task.

### Prototype

The prototype's source code and a description how to use it is available in this [repository](https://github.com/UST-EDMM/edmm/tree/multi-tool-deployment).

---

### Learn More

* Michael Wurster, Uwe Breitenbücher, Michael Falkenthal, Christoph Krieger, Frank Leymann & Karoline Saatkamp:
  [**The Essential Deployment Metamodel: A Systematic Review of Deployment Automation Technologies**](https://link.springer.com/article/10.1007%2Fs00450-019-00412-x).
  In: SICS Software-Intensive Cyber-Physical Systems (2019)
* Michael Wurster, Uwe Breitenbücher, Antonio Brogi, Ghareeb Falazi, Lukas Harzenetter, Frank Leymann, Jacopo Soldani and Vladimir Yussupov:
  [**The EDMM Modeling and Transformation System**](https://www.iaas.uni-stuttgart.de/publications/ICSOC-2019-The-EDMM-Modeling-and-Transformation-System.pdf).
  In: Service-Oriented Computing - ICSOC 2019 Workshops (2019)
* Michael Wurster, Uwe Breitenbücher, Antonio Brogi, Lukas Harzenetter, Frank Leymann, and Jacopo Soldani:
  [**Technology-Agnostic Declarative Deployment Automation of Cloud Applications**](https://www.iaas.uni-stuttgart.de/publications/INPROC-2020-13-Technology-Agnostic-Declarative-Deployment-Automation.pdf).
  In: Service-Oriented and Cloud Computing (ESOCC 2020), 2020
