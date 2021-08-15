# ado-selfhosted-aci

ADO Selfhosted Agent using ACI

This repo contains two modules.

1. ADO Agent
2. ACI Setup using Terraform.

## Pre-Request :

1.  Generate the Azure Devops PAT Token for Self hosted Agent setup.

## 1. ADO Agent

This directory contains the code to build docker image for Azure Selfhosted Agent and push the image to Docker Hub container registry using Pipelines

## 2. Terraform :

This directory contains the code to deploy the Azure Container instance pulling image from docker registry and run the Self hosted agent within Subnet/ private ip address.
