data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "ec2_instance" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  count                  = "${var.number_of_instances}"
  associate_public_ip_address = "${var.public_ip}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.ssh_key}"
  vpc_security_group_ids = ["${var.sgs}"]
  user_data              = "${file("${path.module}/${var.user_data}")}"

  tags {
    Name        = "${var.name}"
    Environment = "${var.environment}"
    terraform   = "true"
  }
}
