.PHONY: init
init:
	@terraform init

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
