# terraform-eks-setup-deployment


## Task in Hand

### ASSIGNMENT

 ```
Refer to this repo: https://github.com/ranupratapsingh/benchmarks

This repo contains 4 small backend applications in different languages.

 

Pick any 2 of them, and create deployment scripts for them in HA setup.

Assume AWS as cloud.
Number of server instances should be configurable
Load balancer(e.g. AWS ALB) configuration to be part of assignment
You Should cover
Server provisioning
Config management
Subsequent deployment
You can do it without without kuberntes.
 

Try ensuring best practices & quality(ease of understanding and well documented).
 ```

## Approach

We will be using AWS as the cloud provider and the deployment will be done on EKS.

The infra setup will be handled through terraform with s3 and dynamodb

## Usage

### Below commands are commands used

The init argument will initialize the environment.
```bash
$ terraform init
```

The plan argument will syntax check the files and prepare the deployment.
```bash
$ terraform plan 
```

Deploy the Resources:

```bash
$ terraform apply 
```

To destroy the setup done using terraform execute:
```bash
$ terraform destroy
```

## Infra Creation

Note: We have went with folder structure for each component of AWS for easy understading.

### Create backend


The backend will be used in further to store the state file in s3 and blocking mutiple people running the tasks at same time using dynamodb

```bash
$ cd terraform-eks-setup-deployment/terraform/backend
$ terraform init
$ terraform plan
$ terraform apply
```

### Create VPC

The VPC will be used where services will be deployed.

```bash
$ cd terraform-eks-setup-deployment/terraform/vpc
$ terraform init
$ terraform plan
$ terraform apply
```

### Create Bastion Server

The Bastion server has admin access. Which is not suggested so please provide the least access only.

```bash
$ cd terraform-eks-setup-deployment/terraform/ec2-bastion
$ terraform init
$ terraform plan
$ terraform apply
```

### Create EKS Cluster

From here please start running the same on bastion server

```bash
$ cd terraform-eks-setup-deployment/terraform/eks
$ terraform init
$ terraform plan
$ terraform apply
```

### EKSCTL setup

Run the below script on bastion server to connect to EKS using kubectl and other dependencies

```bash
$ sh eksctl-setup.sh
```


## Dockerization

The code has been copied from https://github.com/ranupratapsingh/benchmarks

Please create ECR repo as required.

### RAILS_API

We have created a Dockerfile and docker-build.sh

docker-build.sh builds the image with a tag and pushed to ECR.

### EXPRESS_API

We have created a Dockerfile and docker-build.sh

docker-build.sh builds the image with a tag and pushed to ECR.

##### Note: For code uniformity Port is changed to 3000


## EKS deployment

We are using ingress and will be using rules to keep single LB to handle the traffic with the help of ingress. 

Also metrics-server is used to find for HPA.

### Command

```bash
$ cd terraform-eks-setup-deployment/kubenetes/ 
$ sh deployment.sh
```

Note: I have tested one application at a time as host based routing with ALB controller is not working.

So need to use nginx/istio/haproxy ingress to run all the apps at the same time.
