terraform {
  backend "s3" {
    bucket = "xebicon-incidents-automation-terraform-state"
    key    = "terraform-cachethq.tfstate"
    region = "eu-west-1"
    dynamodb_table  = "xebicon-incidents-automation-terraform-state-lock"
  }
}

# Variables - Re-emitted as outputs for Packer

variable "ami_id" {
  type        = "string"
  description = "AMI ID to be deployed"
}
output "ami_id" {
  value = "${var.ami_id}"
}

variable "project_id" {
  type        = "string"
  description = "Project name, formatted to be used as an ID ([a-z-]+)"
}

variable "project" {
  type        = "string"
  description = "Full name of the project"
}

variable "owner" {
  type        = "string"
  description = "E-mail of the owner of the resources, to be contacted if needed"
}

variable "region" {
  type        = "string"
  description = "AWS region to provision stuff to"
}

variable "vpc_id" {
  type        = "string"
  description = "VPC ID"
}

variable "subnet_id" {
  type        = "string"
  description = "Subnet ID"
}

# Provider

provider "aws" {
  region = "${var.region}"
  version = "~> 0.1"
}
