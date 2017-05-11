output "ec2_private_ips" {
  value = ["${aws_instance.ec2_instance.*.private_ip}"]
}

output "ec2_public_ips" {
  value = ["${aws_instance.ec2_instance.*.public_ip}"]
}

output "ec2_instance_id" {
  value = ["${aws_instance.ec2_instance.*.id}"]
}
