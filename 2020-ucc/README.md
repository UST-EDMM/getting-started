
# UCC 2020 Motivating Scenario

The [holistic EDMM model](01_edmm) defines the motivating scenario to deploy a Java application connecting to a MySQL database at runtime.
It was modeled and exported using the [EDMM Modeling Tool](https://github.com/eclipse/winery).

Afterwards, the exported EDMM deployment [model](01_edmm/deployment.yml) was extended by the newly introduced syntax to define the deployment technology that should be used to deploy specific components.
The `technology_regions` block defines the deployment technology, e.g., Ansible, and the respective components that should be deployed with this technology.

From here, the [EDMM Transformation Framework](https://github.com/UST-EDMM/transformation-framework) is used in **multi deployment** mode to split the holistic EDMM model and transform it into the chosen deployment technologies.
For the motivating scenario, the result is available [here](02_dtsm) where separate deployment technology-specific models (DTSMs) have been created.

The orchestration workflow is currently available as simple JSON [file](02_dtsm/execution.plan.json) which defines the execution order for the generated DTSMs.
At this stage of the prototype, we do not use a standardized workflow language, such as BPEL or BPMN, neither a respective workflow engine.
The created workflow for execution is interpreted by the EDMM Transformation Framework currently, which will trigger the respective *Execution Plugin* to trigger the deployment based on a given DTSM.
Further, it also implements the capability to *retrieve*, *store*, and *distribute* input and outputs before and after each workflow task.

## Prototype

The prototype's source code and a description how it is used is avialable [here](https://github.com/diezfx/transformation-framework).

---

## Learn More

* Michael Wurster, Uwe Breitenbücher, Michael Falkenthal, Christoph Krieger, Frank Leymann & Karoline Saatkamp:
  [**The Essential Deployment Metamodel: A Systematic Review of Deployment Automation Technologies**](https://link.springer.com/article/10.1007%2Fs00450-019-00412-x).
  In: SICS Software-Intensive Cyber-Physical Systems (2019)
* Michael Wurster, Uwe Breitenbücher, Antonio Brogi, Ghareeb Falazi, Lukas Harzenetter, Frank Leymann, Jacopo Soldani and Vladimir Yussupov:
  [**The EDMM Modeling and Transformation System**](https://www.iaas.uni-stuttgart.de/publications/ICSOC-2019-The-EDMM-Modeling-and-Transformation-System.pdf).
  In: Service-Oriented Computing - ICSOC 2019 Workshops (2019)
* Michael Wurster, Uwe Breitenbücher, Antonio Brogi, Lukas Harzenetter, Frank Leymann, and Jacopo Soldani:
  [**Technology-Agnostic Declarative Deployment Automation of Cloud Applications**](https://www.iaas.uni-stuttgart.de/publications/INPROC-2020-13-Technology-Agnostic-Declarative-Deployment-Automation.pdf).
  In: Service-Oriented and Cloud Computing (ESOCC 2020), 2020
