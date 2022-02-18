# Hello World Web-App

## Contents
This repo contains the web-app source-code in python, the dockerfile and the requirements to create an image, the terraform code to create a GKE Cluster and install Argo in said GKE Cluster and the YAML files for argo to deploy inside.

## Steps to deploy

1. Clone the repo with`git clone https://github.com/EudaldGM/hello-webapp`
2. Go to hello-webapp `cd hello-webapp`
3. From there initialize terraform, plan it to see if it works and apply it.
	3.1. Planning/Applying the terraform file will ask you for 2 variables the project name and the cluster name. They both accept  a string.

## Requirements
 - GCP Account, and a valid project to deploy the GKE Cluster.
 - Access to the image `gcr.io/w38-eguillen/mywebapp2` or creating an image with the dockerfile in the `webapp-code` folder.
 
 ## Why GKE
  - It offers vertical and horizontal scalability to satisfy the number of requests.
  - It works based on containerization, thus avoids incompatibility dependenciy issues.
  - It allows me to define everything in the terraform files and deploy it in one single step.
  - While it could be deployed with a GCE VM, the GKE cluster allows more flexibility at a more adjusted cost throughout the app livecycle.
