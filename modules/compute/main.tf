#####################
# create instances
#####################

resource "aws_key_pair" "my_key" {
  key_name = "my_key_name"
  public_key = "${file("${var.key_path}")}"
}

resource "aws_instance" "instance1" {
  ami = "${var.ami}"
  instance_type = "m1.small"
  subnet_id = "${var.subnet_id}"
  key_name = "${aws_key_pair.my_key.key_name}"
  associate_public_ip_address = true
  source_dest_check = false
  user_data = "${file("install_docker_and_compose.sh")}"
  vpc_security_group_ids = ["${var.sg_id}"]
  depends_on = []
}
