resource "aws_instance" "ec2_instance" {
  ami                         = "${data.aws_ami.ami.id}"
  count                       = "${var.number_of_instances}"
  associate_public_ip_address = "${var.public_ip}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${element(data.aws_subnet_ids.subnets.ids, count.index)}"
  key_name                    = "${var.ssh_key}"
  vpc_security_group_ids      = ["${var.sgs}"]
  user_data                   = "${file("${path.module}/${var.user_data}")}"

  root_block_device {
    volume_type           = "${var.root_volume_type}"
    volume_size           = "${var.root_volume_size}"
    delete_on_termination = "${var.root_volume_delete}"
  }

  tags {
    Name        = "${var.name}"
    Environment = "${var.environment}"
    terraform   = "true"
  }
}
