# Environment variables and defaults used for running make commands
CONTAINER_NAME=zetest
IMAGE_NAME=centos:latest

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

pull-image:  ## Pulls a specified public image: make pull-image IMAGE_NAME=centos:latest
	docker pull ${IMAGE_NAME}

run: ## Runs specified container: make run IMAGE_NAME=centos
	 docker run -d --name $(CONTAINER_NAME) -it $(IMAGE_NAME)

commit: ## Saves the docker image at a specific time: make commit CONTAINER_NAME=zetest
	docker commit $(CONTAINER_NAME)

clean: ## Deletes all exited containers : make clean
	docker rm $(docker ps -a -f status=exited -q)

run-local-jenkins:  ## Runs a local jenkins container for dev
	docker run --publish 8080:8080 --name jenkinsci jenkins/jenkins:lts
