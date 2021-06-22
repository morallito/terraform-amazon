# include env variables to be used in amazon login
# change the .env in order to get you own vars there
include .env
export

.PHONY: init
# Parse the Smazon AK and SAK as a env variables configured in a .env file.
init:
	@terraform init --migrate-state\
		-backend-config="access_key=$(access_key)"\
		-backend-config="secret_key=$(secret_key)";


plan:
	@terraform plan -out tfplan -lock=false

apply:
	@terraform apply "tfplan" 

destroy:
	@terraform destroy -lock=false

fmt:
	@terraform fmt -recursive -diff

validate:
	@terraform validate
