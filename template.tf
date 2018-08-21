provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_vpc" "vpc1" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
    Name = "vpc1"
  }
}


resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.vpc1.id}"
  cidr_block = "${var.public_subnet_cidr}"
  tags {
    Name = "Public Subnet"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc1.id}"
  tags {
    Name = "Internet gw"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.vpc1.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public-rt-assoc" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}


resource "aws_security_group" "sg-ssh-http" {
  name = "sg-ssh-http"
  description = "Allow incoming HTTP and SSH"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }

  vpc_id="${aws_vpc.vpc1.id}"

  tags {
    Name = "SSH and HTTP SG"
  }
}


resource "aws_key_pair" "my_key" {
  key_name = "my_key_name"
  public_key = "${file("${var.key_path}")}"
}

resource "aws_instance" "instance1" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public-subnet.id}"
  key_name = "${aws_key_pair.my_key.key_name}"
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${file("install_docker_and_compose.sh")}"
  vpc_security_group_ids = ["${aws_security_group.sg-ssh-http.id}"]
}
