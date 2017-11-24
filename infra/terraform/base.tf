terraform {
  backend "s3" {
    bucket = "xebicon-incidents-automation-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table  = "xebicon-incidents-automation-terraform-state-lock"
  }
}

# Variables - Re-emitted as outputs for Packer

variable "project_id" {
  type        = "string"
  description = "Project name, formatted to be used as an ID ([a-z-]+)"
}
output "project_id" {
  value = "${var.project_id}"
}

variable "project" {
  type        = "string"
  description = "Full name of the project"
}
output "project" {
  value = "${var.project}"
}

variable "owner" {
  type        = "string"
  description = "E-mail of the owner of the resources, to be contacted if needed"
}
output "owner" {
  value = "${var.owner}"
}

variable "region" {
  type        = "string"
  description = "AWS region to provision stuff to"
}
output "region" {
  value = "${var.region}"
}

# Provider

provider "aws" {
  region = "${var.region}"
  version = "~> 0.1"
}


#variable "owner" {
#  type        = "string"
#  description = "E-mail of the owner of the resources, to be contacted if needed"
#}
#
#variable "ami" {
#  type        = "string"
#  description = "ID of the AMI used to spawn instances"
#}
#
#variable "services_ami" {
#  type        = "string"
#  description = "ID of the AMI used to spawn the services instance"
#}
#
#variable "students-number" {
#  type =      "string"
#  description = "Number of students for the training session"
#}
#
#variable "keypair" {
#  type        = "string"
#  description = "Name of the keypair to associate to instances"
#}
#
#variable "type" {
#  type        = "string"
#  description = "Instances type"
#}
#
#variable "subnet" {
#  type        = "string"
#  description = "Subnet for instances"
#}
#
#variable "root_volume_size" {
#  type        = "string"
#  description = "Size of the root block device"
#  default     = "50"
#}
