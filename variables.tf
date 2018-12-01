variable "name" {}
variable "environment" {}
variable "ssh_key" {}

variable "number_of_instances" {
  default = 1
}

variable "public_ip" {
  default = "false"
}

variable "sgs" {
  type = "list"
}

variable "user_data" {}
variable "tier" {}
variable "vpc_id" {}
variable "region" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_ami" {
  default = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}

variable "owners" {
  default = "099720109477"
}

variable "root_volume_size" {
  default = 8
}

variable "root_volume_type" {
  default = "gp2"
}

variable "root_volume_delete" {
  default = true
}
