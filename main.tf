#####################
# provider aws
#####################

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}


module "networking" {
      source = "./modules/networking"
      
}
module "compute" {
      source = "./modules/compute"
      subnet_id = "${module.networking.subnet_id}"
      sg_id = "${module.networking.sg_id}"
}
