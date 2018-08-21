variable "access_key" {}
variable "secret_key" {}

variable "aws_region" {
  description = "AWS Region"
  default = "eu-central-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  default = "10.0.2.0/24"
}

variable "ami" {
  description = "Ubuntu 16.04"
  default = "ami-9fbfb174"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/Users/boomfaya/.ssh/id_rsa.pub"
}
