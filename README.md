terraform_aws_ec2
===========

A terraform module to provision Ubuntu EC2 instances in AWS.


Module Input Variables
----------------------

- `name`                - variable name
- `environment`         - variable environment
- `subnet_id`           - id of the subnet where to start the instance
- `number_of_instances` - number of instances to start
- `instance_type`       - type of instance_type
- `public_ip`           - whether to assign a public ip to the instance.
- `ssh_key`             - ssh key
- `user_data`           - user data script
- `sgs`                 - security group ids
- `user_data`           - override userdata to local "../../../provisioning.sh"
Usage
-----

```hcl
module "demo_ec2" {
  source      = "github.com/stack42/terraform_aws_ec2/"
  number_of_instances = "1"
  instance_type       = "t2.micro"
  public_ip           = "true"
  tier                = "Public"
  ssh_key             = "<a_valid_ssh_key>"
  user_data           = "provisioning.sh"
  sgs                 = ["<Security Groups>"]
  name                = "${var.name}"
  environment         = "${var.environment}"
  vpc_id              = "vpc_id"
  region              = "region"
  }
```


Outputs
=======

 - `name`            - does what it says on the tin
 - `environment`     - does what it says on the tin
 - `ec2_private_ips` - does what it says on the tin
 - `ec_public_ips`   - does what it says on the tin
 - `ec2_instance_id` - does what it says on the tin



Authors
=======

phillip@bailey.st
