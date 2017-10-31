# KubeNet
The below commands create and configure a Kubernetes cluster on Azure, which I used to demo in a technical 
session _"Kubernetes on Azure"_. This is not a highly sophisticated demo-script, more like a memory aid and compilation 
of necessary steps. You can also find the commands compiled as scripts in the repository. 

I am used to working in a bash-environment, 
but I cannot imagine giving-up Visual Studio, so having the Linux Subsystem on Windows is really an asset. 

> You are viewing commands for the old version of the Azure Container Service. Azure Container Service (AKS) is being updated to a newer version, which is currently in public preview.

## Pre-requisites

Enable WSL on [Windows 10](https://msdn.microsoft.com/en-us/commandline/wsl/install-win10). Install the most recent version of [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest).

## Create a Kubernetes cluster on Azure


First, create a resource group

```
$ az group create --name k8s --location westeurope
```

Create Kubernetes cluster (creates service principal and ssh-keys) with default of 3 nodes

```
$ az acs create --orchestrator-type kubernetes --resource-group k8s --name myK8sCluster --generate-ssh-keys 
```
Alternatively, if you already have generated ssh-keys in your .ssh/ folder, you can also use the 
--ssh-key-value ~/.ssh/id_rsa.pub flag. 

Download credentials
```
$ az acs kubernetes get-credentials --resource-group=k8s --name= myK8sCluster
```

Get node information
```
$ kubectl get nodes
```

Get cluster-information
```
$ kubectl cluster-info
```
## Deploy pods

Deploy docker images in pods and create a service, i.e. with sample yaml-file 
Create a yaml-<file>, as in [this sample](https://docs.microsoft.com/en-us/azure/container-service/kubernetes/container-service-kubernetes-walkthrough#run-the-application), in your directory and deploy

```
$ kubectl create -f youryamlfile.yaml
```

Get pods, service
```
$ kubectl get pods
$ kubectl describe pod <yourpod>
$ kubectl get service <yourappname> watch
$ kubectl describe services <yourappname>-service
```


