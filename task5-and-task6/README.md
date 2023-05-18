## To run a Jenkins instance inside the Kubernetes cluster and create a Jenkins pipeline, you can follow these steps:

## Set up Kubernetes Cluster:

Ensure you have a working Kubernetes cluster created either using kubeadm or RKE, as mentioned in the previous steps.
Deploy Jenkins using Helm:

Helm is a package manager for Kubernetes that simplifies the deployment of applications. Install Helm on your local machine.

Add the Jenkins Helm chart repository by running the following command:
Commands:
   - helm repo add jenkins https://charts.jenkins.io
   - helm repo update

## Install Jenkins using Helm:
Command: 
  - helm install jenkins jenkins/jenkins
This command deploys the Jenkins chart from the Jenkins Helm repository and creates a Jenkins instance in the Kubernetes cluster.

## Access Jenkins UI:
Retrieve the Jenkins service URL by running the following command:
command: 
   - kubectl get services
Look for the Jenkins service and note the external IP or domain associated with it.
Access the Jenkins UI by opening a web browser and entering the Jenkins service URL. Follow the instructions to complete the Jenkins setup process, including creating an admin user.

## Configure Jenkins Agent:
- Jenkins pipelines typically require one or more Jenkins agents to execute jobs.
- Create a Kubernetes configuration file (e.g., jenkins-agent.yaml) that describes the Jenkins agent deployment.
- In this example, the Jenkins agent is configured using the jenkins/jnlp-slave image.
- Update the JENKINS_URL value with the correct Jenkins service URL.
- Create a secret with the name jenkins-agent-secret and a key agent that contains the agent secret for authentication.
- Deploy the Jenkins agent using the configuration file:
  command:
    - kubectl apply -f jenkins-agent.yaml

## Create Jenkins pipeline:

- In the Jenkins UI, create a new pipeline job.
- Configure the pipeline job to use the Jenkinsfile located in your forked repository.
- The Jenkinsfile defines the stages and steps of your pipeline, including cloning the repository, building the application, and deploying it to the Kubernetes cluster.

## Run Jenkins pipeline:
- Trigger the Jenkins pipeline manually or configure it to be triggered automatically based on events like code commits or a schedule.
- Observe the pipeline's execution in the Jenkins UI, including the successful execution of each stage.
- With these steps, you should have a Jenkins instance running inside the Kubernetes cluster, and a Jenkins pipeline configured to build and deploy applications. we can further customize the pipeline stages and steps to meet your specific requirements.
