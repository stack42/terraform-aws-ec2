data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.aws_ami}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["${var.owners}"] # Canonical
}

data "aws_subnet_ids" "subnets" {
  vpc_id = "${var.vpc_id}"

  tags {
    Tier = "${var.tier}"
  }
}
