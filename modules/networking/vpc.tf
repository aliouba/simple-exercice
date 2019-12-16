resource "aws_vpc" "vpc1" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc1"
  }
}
