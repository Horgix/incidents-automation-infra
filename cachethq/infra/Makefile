ami::
	cd ./ami/ && packer build packer.json

# TODO : Improve and use terraform output instead since the state is remote now
#get_ips::
#	cat .terraform/terraform.tfstate | jq -r '.modules[].resources[] | select(.type == "aws_instance") | .primary.attributes | [ ."tags.Name" , .public_ip] | join("\t")' | sort
