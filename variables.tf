variable "name" {}

variable "environment" {}

variable "ssh_key" {}

variable "instance_type" {}

variable "subnet_id" {}

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
