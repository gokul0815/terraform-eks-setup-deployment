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
​
The plan argument will syntax check the files and prepare the deployment.
```bash
$ terraform plan -out assignment.plan
```
​
Deploy the VPC:
​
```bash
$ terraform apply assignment.plan
```
​
This will deploy the terraform in AWS:
​
```bash
$ terraform show
```
​
To destroy the setup done using terraform execute:
```bash
$ terraform destroy
```
