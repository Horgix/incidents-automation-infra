#! /usr/bin/env make

export PROJECT_ID 	:= $(shell cd ../terraform && terraform output project_id)
export PROJECT		:= $(shell cd ../terraform && terraform output project)
export OWNER		:= $(shell cd ../terraform && terraform output owner)
export REGION		:= $(shell cd ../terraform && terraform output region)
export SUBNET_ID	:= $(shell cd ../terraform && terraform output subnet_id_a)
export VPC_ID		:= $(shell cd ../terraform && terraform output vpc_id)

export TF_VAR_project_id = ${PROJECT_ID}
export TF_VAR_project = ${PROJECT}
export TF_VAR_owner = ${OWNER}
export TF_VAR_region = ${REGION}
export TF_VAR_subnet_id = ${SUBNET_ID}
export TF_VAR_vpc_id = ${VPC_ID}

debug_vars::
	@echo "Project ID: ${PROJECT_ID}"
	@echo "Project: ${PROJECT}"
	@echo "Owner: ${OWNER}"
	@echo "Region: ${REGION}"
	@echo "Subnet ID: ${SUBNET_ID}"
	@echo "VPC ID: ${VPC_ID}"

ami:: debug_vars
	. ./venv/bin/activate
	packer build packer.json

terraform:: debug_vars
	env | grep 'TF_VAR_'
	bash -c 'echo $${TF_VAR_subnet_id}'
	cd terraform && terraform $(filter-out $@,$(MAKECMDGOALS))

%:
	@:
