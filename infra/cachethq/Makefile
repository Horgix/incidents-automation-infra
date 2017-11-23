#! /usr/bin/env make

PROJECT_ID 	:= $(shell cd ../terraform && terraform output project_id)
PROJECT		:= $(shell cd ../terraform && terraform output project)
OWNER		:= $(shell cd ../terraform && terraform output owner)
REGION		:= $(shell cd ../terraform && terraform output region)
SUBNET_ID	:= $(shell cd ../terraform && terraform output subnet_id_a)
VPC_ID		:= $(shell cd ../terraform && terraform output vpc_id)

export PROJECT_ID
export PROJECT
export OWNER
export REGION
export SUBNET_ID
export VPC_ID

ami::
	@echo "Project ID: ${PROJECT_ID}"
	@echo "Project: ${PROJECT}"
	@echo "Owner: ${OWNER}"
	@echo "Region: ${REGION}"
	@echo "Subnet ID: ${SUBNET_ID}"
	@echo "VPC ID: ${SUBNET_ID}"
	#bash -c 'echo ${REGION}'
	. ./venv/bin/activate
	packer build packer.json
