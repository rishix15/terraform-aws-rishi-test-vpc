# terraform-aws-vpc

## Overview
This Terraform module provisions an AWS Virtual Private Cloud (VPC) with a configurable CIDR block.  
It creates public and private subnets and sets up an Internet Gateway (IGW) and route tables whenever a subnet is marked as public.

## Features
- Create a VPC with a custom CIDR block and name  
- Define multiple public and private subnets  
- Conditionally create an Internet Gateway when public subnets exist  
- Configure route tables for public subnets  

## Usage
Example root configuration:

---
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./module/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-terraform-vpc"
  }

  subnet_config = {
    public_subnet = {
      cidr_block = "10.0.0.0/24"
      az         = "us-east-1a"
      public     = true   # Internet Gateway will be created
    }
    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1b"
      # public defaults to false
    }
  }
}
---
