##
# etcd cluster 
#
# @file
# @version 0.1
#

NAME=example
FLAGS=-var-file tfvars/$(NAME).tfvars

init:
	if ls .terraform 1> /dev/null 2>&1; then rm -rf .terraform; rm -rf .terraform.lock.hcl; fi
	terraform init -backend-config=backend/$(NAME).tfvars

plan:
	terraform plan $(FLAGS)

apply:
	terraform apply $(FLAGS)

destroy:
	terraform destroy $(FLAGS)

vm-list:
	LIBVIRT_DEFAULT_URI=qemu:///system virsh list
# end
