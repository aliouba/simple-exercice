# Requirements

* Terraform
* AWS account (access_key and secret_key are required)

# Simple way (Development only)

	# Deploy AWS infrastructure with terraform
	 terraform plan
	 terrafom apply
	# build image to a curl package that is required for HEALTHCHECK
	ssh to instance created via terraform
	git clone https://github.com/aliouba/simple-exercice
	cd simple-exercice
	docker build -t port-tutorial-with-curl .
	# Deployment
	docker-compose up -d
# Alternative

	Swarm
	Kubernetes



