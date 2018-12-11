# Requirements

* Terraform
* AWS account (access_key and secret_key are required)

# Simple way (Development only)

	# Deploy AWS infrastructure with terraform
	 	terraform plan
	 	terrafom apply
	# build image and curl package that is required for HEALTHCHECK
		ssh to instance created via terraform
		git clone https://github.com/aliouba/simple-exercice
		cd simple-exercice
		docker build -t port-tutorial-with-curl .
	# Deployment
		docker-compose up -d
# Alternatives

	#Swarm
		docker swarm init
		docker stack deploy --compose-file swarkit-docker-compose.yaml port-tutorial
		To get the unique endpoint that targets the 3 instances: docker service ls
	#Kubernetes (Kubernetes Cluster is required)
		kubectl create -f kubernetes/
		To get the unique endpoint that targets the 3 instances: kubectl get svc



