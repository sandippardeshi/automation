

----------

# Crating an Infrastructure on AWS with AWS EKS Cluster 

## Table of Contents

-   [Overview](#overview)
    
-   [Prerequisites](#prerequisites)
    
-   [Getting Started](#getting-started)
    
    -   [Workstation Setup](#workstation-setup)
        
    -   [Directory Structure](#directory-structure)
        
-   [Creating an EKS Cluster](#creating-an-eks-cluster)
    
-   [Nodegroup Creation](#nodegroup-creation)
    
-   [ALB Creation](#alb-creation)
    
-   [DNS Mapping](#dns-mapping)
    
-   [Additional Notes](#additional-notes)
    

## Overview

This document provides step-by-step instructions for setting up an infrastructure environment on AWS using Amazon Elastic Kubernetes Service (EKS). The setup includes creating a workstation, configuring necessary tools, creating an EKS cluster, and more.

### Prerequisites

-   An AWS account with appropriate permissions.
    
-   AWS CLI and kubectl installed on your EC2 workstation.
    
-   An EC2 workstation instance with an IAM role granting necessary permissions for EKS and other AWS services.
    
-   Shell scripts and YAML files for cluster creation and ALB setup.
    

## Getting Started

### Workstation Setup

#### Launch an EC2 Instance

1.  Launch an EC2 instance (e.g., t2.micro) with the latest version of Ubuntu.
    
2.  Ensure that the instance has an IAM role attached with permissions to create and manage EKS clusters, EC2 instances, and other necessary AWS services.
    

#### Install Required Tools

-   Install the following tools on your EC2 instance:
    
    -   [eksctl](https://eksctl.io/): A command-line utility for creating and managing EKS clusters.
        
    -   [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/): Command-line tool for interacting with Kubernetes clusters.
        
    -   [helm](https://helm.sh/): Package manager for Kubernetes.
        
    -   [aws-cli](https://aws.amazon.com/cli/): The official AWS command-line interface.
        
    -   [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html): Used for authentication with EKS clusters.
        

### Directory Structure

1.  Create a directory for your environment, e.g., `/home/ubuntu/env`.
    
2.  Clone the provided shell scripts and YAML files into this directory.
    
3.  Modify the YAML files as per your environment requirements.
    

Ensure that all the tools and scripts are up-to-date to minimize debugging efforts.

## Creating an EKS Cluster

1 .Edit the `cluster.yml` file to customize the configuration. Update values such as
 
 1. metadata: This section contains metadata about the EKS cluster: 
    * name: You should replace with the desired name for your EKS cluster. 
    * region: You should replace with the AWS region where you want to create your EKS cluster. 
 2. vpc: This section configures the Virtual Private Cloud (VPC) settings for your EKS cluster:
    * cidr: You should replace with the desired CIDR block for your VPC. The CIDR block defines the IP address range for your VPC. 

 3. Optionally, you can uncomment the auto Allocate IPv6 field (by removing the # at the beginning of the line) if you want to enable IPv6 for your VPC. IPv6 is disabled by default. You can also uncomment and configure the publicAccess and privateAccess settings to control the network access to your cluster's API server. In the provided script, public access is disabled (publicAccess: false), and private access is enabled (privateAccess: true). This means that the API server will only be accessible privately within the VPC. 
 4.  availabilityZones: This field specifies the availability zones (AZs) where your EKS nodes will be deployed. In the example, it includes three availability zones: 'AZ1', 'AZ2', and 'AZ3'. You can adjust this list based on your requirements and the availability zones available in your chosen AWS region.
 
 
 2 .Run the `cluster.yml` script to create your EKS cluster using the configured settings.
    

## IAM OIDC Provider Associate

1. Open the `oidc.sh` script and change the cluster name to match your EKS cluster's name.
* region : You should replace with the AWS region where your EKS cluster is located. This specifies the region in which the IAM OIDC provider will be associated.
* cluster : You should replace with the name of your EKS cluster. This indicates the EKS cluster with which the IAM OIDC provider will be associated.

**Note:** The purpose of associating an IAM OIDC provider with an EKS cluster is to enable Kubernetes service accounts to use AWS IAM roles for authentication and authorization within the cluster. This integration allows you to define IAM roles and policies that can be assumed by pods running in your EKS cluster, providing a fine-grained control mechanism for accessing AWS resources.

2 . Execute the  `oidc.sh` script to set up OIDC (OpenID Connect) for your EKS cluster.
    

## Load Balancer Controller setup

The script's name,  `controller.sh` suggests that it's used to set up the AWS Load Balancer Controller on an EKS cluster. Open the  `controller.sh` script then here's what you can modify:

1.  cluster_name: Replace with the actual name of your EKS cluster.
    
2.  env: Replace with the desired environment name.
    
3.  account_id: Replace with your AWS account ID.
    
4.  aws-load-balancer-controller/v2.4.2: This script is fetching a specific version (v2.4.2) of the AWS Load Balancer Controller policy document. If you want to use a different version or the latest version, update the URL accordingly.
    
5.  You can adjust Helm values and configurations based on your requirements. In this script, it installs the AWS Load Balancer Controller chart and sets various options such as clusterName and service account settings.
    
6.  Run controller.sh Execute the controller.sh script to set up the EKS control plane.
    

## Nodegroup Creation

1 .  Open the `nodegroup.sh` script and customize it. Change the instance type, minimum and maximum node counts, region, and other node group settings.
         Here's what you should change in the script:

1. (Provide cluster name here):  Replace this placeholder with the actual name of your EKS cluster.
    
2.  (Provide AWS Region here) : Replace this with the AWS region where your EKS cluster is located (e.g., us-east-1).
    
3.   (Provide Node Group name here): Replace this with a suitable name for your node group.
    
4.  (Provide Instance name here) : Specify the EC2 instance type you want to use for your worker nodes (e.g., t2.micro, t3.large).
    
5. (Provide minimum number of instances required) and (Provide maximum number of instances required): Define the minimum and maximum number of instances for your node group as needed.
6. (Provide volume size required) : Specify the desired volume size for each node in the node group.

7. (Provide public key name here) : Replace this with the name of an existing SSH public key that you want to use for SSH access to the instances.

**Note** :- The script is named "node-group.sh" and is used to create an EKS node group with the specified configurations. It also enables various features like SSH access, managed node group, ASG (Auto Scaling Group) access, and more, depending on your needs.
    
2 .  Execute the `nodegroup.sh` script to create a node group for your EKS cluster.
    

## ALB Creation

1 .  Edit the `public.alb.yml` script to define path-based routing rules by specifying path patterns and target services in your Application Load Balancer (ALB).
    
2.  (Provide name here) : Replace this placeholder with a meaningful name for your Ingress resource.
    
3.  (Provide project name here) : Replace this with an appropriate label for your application.
    
4.  (Provide service1 path here), (Provide service2 path here) and  (Provide service3 path here) : Customize the paths to match the routing paths you want for your services. These paths determine how incoming traffic is directed to your services.
    
5.  (Provide service1 name here), (Provide service2 name here), and (Provide service3 name here) : Replace these placeholders with the names of the Kubernetes services you want to route traffic to.
    
6.  (Provide Port here) : Specify the port number of the service you want to route traffic to.
    

2 . Run the `public.alb.yml` script to create the ALB with path-based routing.

#### ALB Example
ALB path-based routing allows you to direct traffic to different services in our EKS cluster based on the path of the incoming request. This can be useful for routing traffic to different microservices, APIs, or versions of an application.
To configure ALB path-based routing for your EKS cluster, you can use the public.alb.yml file. This file defines the ALB listener rules that will be used to route traffic to your services.
Here is an example of an public.alb.yml file that configures ALB path-based routing for three services in an EKS cluster:

## YAML
`

    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: <provide name here>
        #  namespace: kube-system
      labels:
        app: <provide project name here>-app
      annotations:
        #kubernetes.io/ingress.class: alb
        alb.ingress.kubernetes.io/scheme: internet-facing
        alb.ingress.kubernetes.io/target-type: ip
        alb.ingress.kubernetes.io/healthcheck-protocol: HTTP
        alb.ingress.kubernetes.io/healthcheck-port: traffic-port
        alb.ingress.kubernetes.io/healthcheck-interval-seconds: '15'
        alb.ingress.kubernetes.io/healthcheck-timeout-seconds: '5'
        alb.ingress.kubernetes.io/success-codes: '200'
        alb.ingress.kubernetes.io/healthy-threshold-count: '2'
        alb.ingress.kubernetes.io/unhealthy-threshold-count: '2'
        alb.ingress.kubernetes.io/certificate-arn: arn:aws:acm:us-east-1:737403269845:certificate/78ac091f-ac02-448f-bafd-9e31eb262589
        alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS":443}]'
        alb.ingress.kubernetes.io/actions.ssl-redirect: '{"Type": "redirect", "RedirectConfig": { "Protocol": "HTTPS", "Port": "443", "StatusCode": "HTTP_301"}}'
    spec:
      ingressClassName: alb
      rules:
        - http:
            paths:
              - path: /<provide service1 path here>
                pathType: Prefix
                backend:
                  service:
                    name: <provide service1 name here>-nodeport-service
                    port:
                      number: <provide port here>
              - path: /<provide service2 path here>
                pathType: Prefix
                backend:
                  service:
                    name: <provide service2 name here>-nodeport-service
                    port:
                      number: <provide port here>
              - path: /<provide service3 path here>
                pathType: Prefix
                backend:
                  service:
                    name: <provide service3 name here>-nodeport-service
                    port:
                      number: <provide port here>`


Once the public.alb.yml file is deployed, the ALB will be created and configured with the specified listener rules. You can then send traffic to the ALB and it will be routed to the correct service based on the path of the request.
    

## DNS Mapping

Use Amazon Route 53 or your preferred DNS service to create DNS records and map them to the ALB's DNS name.

## Additional Notes

-   Be cautious when making changes to scripts and configurations to avoid any unexpected issues.
    
-   It is recommended to have a good understanding of AWS services, IAM roles, EKS, and load balancing before proceeding with these steps.
    

----------

This README provides a clear and structured guide to setting up your AWS EKS environment. You can add more details, troubleshooting tips, or additional resources as needed. Make sure to maintain this document as your project evolves, and it will serve as a valuable reference for users and contributors.
