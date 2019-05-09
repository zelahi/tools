help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

run-centos: ## Run the latest centos docker container
	docker pull centos:latest && docker run --name zecentos -it centos
